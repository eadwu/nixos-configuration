{ ... }:

{
  imports = [
    # https://github.com/NixOS/nixos-hardware/blob/master/framework/13-inch/12th-gen-intel/default.nix
    ({ lib, pkgs, ... }: {
      # imports = [
      #   ../common
      #   ../common/intel.nix
      # ];

      boot.kernelParams = [
        # For Power consumption
        # https://kvark.github.io/linux/framework/2021/10/17/framework-nixos.html
        "mem_sleep_default=deep"
        # Workaround iGPU hangs
        # https://discourse.nixos.org/t/intel-12th-gen-igpu-freezes/21768/4
        "i915.enable_psr=1"
      ];

      boot.blacklistedKernelModules = [
        # This enables the brightness and airplane mode keys to work
        # https://community.frame.work/t/12th-gen-not-sending-xf86monbrightnessup-down/20605/11
        "hid-sensor-hub"
        # This fixes controller crashes during sleep
        # https://community.frame.work/t/tracking-fn-key-stops-working-on-popos-after-a-while/21208/32
        "cros_ec_lpcs"
      ];

      # Further tweak to ensure the brightness and airplane mode keys work
      # https://community.frame.work/t/responded-12th-gen-not-sending-xf86monbrightnessup-down/20605/67
      systemd.services.bind-keys-driver = {
        description = "Bind brightness and airplane mode keys to their driver";
        wantedBy = [ "default.target" ];
        after = [ "network.target" ];
        serviceConfig = {
          Type = "oneshot";
          User = "root";
        };
        script = ''
          ls -lad /sys/bus/i2c/devices/i2c-*:* /sys/bus/i2c/drivers/i2c_hid_acpi/i2c-*:*
          if [ -e /sys/bus/i2c/devices/i2c-FRMW0001:00 -a ! -e /sys/bus/i2c/drivers/i2c_hid_acpi/i2c-FRMW0001:00 ]; then
            echo fixing
            echo i2c-FRMW0001:00 > /sys/bus/i2c/drivers/i2c_hid_acpi/bind
            ls -lad /sys/bus/i2c/devices/i2c-*:* /sys/bus/i2c/drivers/i2c_hid_acpi/i2c-*:*
            echo done
          else
            echo no fix needed
          fi
        '';
      };

      # Alder Lake CPUs benefit from kernel 5.18 for ThreadDirector
      # https://www.tomshardware.com/news/intel-thread-director-coming-to-linux-5-18
      boot.kernelPackages = lib.mkIf (lib.versionOlder pkgs.linux.version "5.18") (lib.mkDefault pkgs.linuxPackages_latest);

    })

    # ../common
    ({ lib, pkgs, ... }: {
      # imports = [
      #   ../../../common/pc/laptop
      #   ../../../common/pc/laptop/ssd
      # ];

      # Fix TRRS headphones missing a mic
      # https://community.frame.work/t/headset-microphone-on-linux/12387/3
      boot.extraModprobeConfig = lib.mkIf (lib.versionOlder pkgs.linux.version "6.6.8") ''
        options snd-hda-intel model=dell-headset-multi
      '';

      # For fingerprint support
      services.fprintd.enable = lib.mkDefault true;

      # Custom udev rules
      services.udev.extraRules = ''
        # Ethernet expansion card support
        ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="0bda", ATTR{idProduct}=="8156", ATTR{power/autosuspend}="20"
      '';

      # Fix font sizes in X
      # services.xserver.dpi = 200;

      # Needed for desktop environments to detect/manage display brightness
      hardware.sensor.iio.enable = lib.mkDefault true;
    })

    # ../../../common/pc/laptop
    ({ config, lib, ... }:

    {
      # imports = [ ../. ];

      # Gnome 40 introduced a new way of managing power, without tlp.
      # However, these 2 services clash when enabled simultaneously.
      # https://github.com/NixOS/nixos-hardware/issues/260
      services.tlp.enable = lib.mkDefault ((lib.versionOlder (lib.versions.majorMinor lib.version) "21.05")
                                          || !config.services.power-profiles-daemon.enable);
    })

    # ../.
    ({ config, lib, ... }:

    {
      boot.blacklistedKernelModules = lib.optionals (!config.hardware.enableRedistributableFirmware) [
        "ath3k"
      ];

      services.xserver.libinput.enable = lib.mkDefault true;
    })

    # ../../../common/pc/laptop/ssd
    ({ lib, ... }:

    {
      # services.fstrim.enable = lib.mkDefault true;
    })

    # ../common/intel.nix
    ({ lib, pkgs, ... }: {
      # imports = [
      #   ../../../common/cpu/intel
      # ];

      boot.kernelParams = [
        # Fixes a regression in s2idle, making it more power efficient than deep sleep
        # "acpi_osi=\"!Windows 2020\""
        # For Power consumption
        # https://community.frame.work/t/linux-battery-life-tuning/6665/156
        "nvme.noacpi=1"
      ];

      # Requires at least 5.16 for working wi-fi and bluetooth.
      # https://community.frame.work/t/using-the-ax210-with-linux-on-the-framework-laptop/1844/89
      boot.kernelPackages = lib.mkIf (lib.versionOlder pkgs.linux.version "5.16") (lib.mkDefault pkgs.linuxPackages_latest);

      # Module is not used for Framework EC but causes boot time error log.
      boot.blacklistedKernelModules = [ "cros-usbpd-charger" ];

      # Custom udev rules
      services.udev.extraRules = ''
        # Fix headphone noise when on powersave
        # https://community.frame.work/t/headphone-jack-intermittent-noise/5246/55
        SUBSYSTEM=="pci", ATTR{vendor}=="0x8086", ATTR{device}=="0xa0e0", ATTR{power/control}="on"
      '';

      # Mis-detected by nixos-generate-config
      # https://github.com/NixOS/nixpkgs/issues/171093
      # https://wiki.archlinux.org/title/Framework_Laptop#Changing_the_brightness_of_the_monitor_does_not_work
      hardware.acpilight.enable = lib.mkDefault true;

      # This adds a patched ectool, to interact with the Embedded Controller
      # Can be used to interact with leds from userspace, etc.
      # Not part of a nixos release yet, so package only gets added if it exists.
      environment.systemPackages = lib.optional (pkgs ? "fw-ectool") pkgs.fw-ectool;
    })

    # ../../../common/cpu/intel
    ({
      # imports = [
      #   ./cpu-only.nix
      #   ../../gpu/intel
      # ];
    })

    # ./cpu-only.nix
    ({ config, lib, ... }:

    {
      hardware.cpu.intel.updateMicrocode =
        lib.mkDefault config.hardware.enableRedistributableFirmware;
    })

    # ../../gpu/intel
    ({ config, lib, pkgs, ... }:

    {
      boot.initrd.kernelModules = [ "i915" ];

      # environment.variables = {
      #   VDPAU_DRIVER = lib.mkIf config.hardware.opengl.enable (lib.mkDefault "va_gl");
      # };

      hardware.opengl.extraPackages = with pkgs; [
        (if (lib.versionOlder (lib.versions.majorMinor lib.version) "23.11") then vaapiIntel else intel-vaapi-driver)
        libvdpau-va-gl
        intel-media-driver
      ];
    })
  ];
}
