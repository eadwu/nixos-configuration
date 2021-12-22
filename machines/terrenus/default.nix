{ config, pkgs, ... }:

with config.nixos; {
  imports =
    [
      ./hardware-configuration.nix

      ../../profiles/desktop.nix

      ../../hardware/dell/9570.nix
      # ../../hardware/gpu/nvidia/disable
      ../../hardware/gpu/nvidia/offload
      # ../../hardware/gpu/nvidia/sync

      ../../hardware/profiles/yubikey.nix

      # ../../modules/network/wireguard.nix
      # ../../modules/network/openvpn.nix
    ];

  environment.variables.QT_AUTO_SCREEN_SCALE_FACTOR = toString settings.xserver.dpiScale;

  fonts.fontconfig.antialias = true;

  console = {
    font = "ter-u28n";
    packages = [ pkgs.terminus_font ];
  };

  nixos.settings = {
    system.user = "xps";
    machine.hostname = "terrenus";
    machine.screen.width = 3840;
    machine.screen.height = 2160;

    machine.cpu.tdp = {
      nominal = 35;
      up = 45;
    };

    machine.cpu.undervolt = rec {
      core = (-100);
      gpu = (-75);
      uncore = core;
      analogio = core;
    };

    xserver = {
      dpi = 193;
      dpiScale = 2;
      iccProfile = ../../hardware/display/9570/FNVDR-LQ156D1.icc;
    };
  };

  programs.zsh.interactiveShellInit = ''
    bios-upgrade () {
      ${pkgs.fwupd}/bin/fwupdmgr get-devices
      ${pkgs.fwupd}/bin/fwupdmgr get-updates
      ${pkgs.fwupd}/bin/fwupdmgr update
    }
  '';

  security.allowSimultaneousMultithreading = true;

  services = {
    kresd.instances = 6;

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

      libinput.touchpad.additionalOptions = ''
        Option "AccelSpeed" "1"
      '';
    };
  };
}
