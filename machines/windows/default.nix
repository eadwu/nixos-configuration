{ config, pkgs, ... }:

with config.nixos; {
  imports =
    [
      /etc/nixos/hardware-configuration.nix

      ../../hardware/dell/9570.nix
      # ../../hardware/gpu/nvidia/bumblebee
      # ../../hardware/gpu/nvidia/disable
      ../../hardware/gpu/nvidia/prime

      # ../../modules/network/wireguard.nix
      # ../../modules/network/openvpn.nix
      # ../../modules/xserver/window-manager/bspwm
      ../../modules/xserver/window-manager/dwm

      ../../options/undervolt.nix

      ../../profiles/desktop.nix
    ];

  disabledModules =
    [
      <nixpkgs/nixos/modules/services/hardware/undervolt.nix>
    ];

  environment.variables.QT_AUTO_SCREEN_SCALE_FACTOR = toString settings.xserver.dpiScale;

  fonts.fontconfig = {
    antialias = false;
    # calculated: 282.42
    dpi = 240;
  };

  i18n.consoleFont = "latarcyrheb-sun32";

  nixos.settings = {
    xserver.dpiScale = 2;
    system.user = "xps";

    wireguard = {
      client.addresses = [ "10.100.1.40/24" ];

      server = {
        address = "23.22.8.192";
        credentials = "owMZpd6QLiHuMFgf6d04A6uocFGhlOzJktySIVkv6XU=";
      };
    };
  };

  programs.zsh.interactiveShellInit = ''
    bios-upgrade () {
      ${pkgs.fwupd}/bin/fwupdmgr get-devices
      ${pkgs.fwupd}/bin/fwupdmgr get-updates
      ${pkgs.fwupd}/bin/fwupdmgr update
    }
  '';

  services = {
    tlp.extraConfig = ''
      # Autosuspend for USB device Goodix Fingerprint Device
      USB_WHITELIST="27c6:5395"
    '';

    undervolt = rec {
      enable = true;
      temp = "90";
      coreOffset = "-100";
      gpuOffset = "-75";
      uncoreOffset = coreOffset;
      analogioOffset = coreOffset;
    };

    xserver = {
      extraConfig = ''
        Section "InputClass"
          Identifier "SynPS/2 Synaptics TouchPad"
          MatchProduct "SynPS/2 Synaptics TouchPad"
          MatchIsTouchpad "on"
          MatchOS "Linux"
          MatchDevicePath "/dev/input/event*"
          Option "Ignore" "on"
        EndSection
      '';

      # calculated: 293.58336 165.14064
      monitorSection = ''
        DisplaySize 406 228
      '';

      screenSection = ''
        Option "DPI" "240 x 240"
      '';

      libinput.additionalOptions = ''
        Option "AccelSpeed" "1"
        Option "PalmDetection" "on"
        Option "TappingButtonMap" "lmr"
      '';
    };
  };

  time.hardwareClockInLocalTime = true;
}
