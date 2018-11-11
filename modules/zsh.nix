{ config, pkgs, ... }:

let
  settings = import ../settings.nix;
in with settings; {
  programs = {
    zsh = {
      enable = true;
      interactiveShellInit = ''
        setopt histignorespace

        bios-upgrade () {
          ${pkgs.fwupd}/bin/fwupdmgr get-devices
          ${pkgs.fwupd}/bin/fwupdmgr get-updates
          ${pkgs.fwupd}/bin/fwupdmgr update
        }

        nix-clean () {
          nix-env --delete-generations old
          nix-store --gc
          nix-channel --update
          nix-env -u --always
          for link in /nix/var/nix/gcroots/auto/*; do rm $(readlink "$link"); done
          nix-collect-garbage -d
        }
      '';

      ohMyZsh = {
        enable = true;
        customPkgs = with pkgs; [ spaceship-prompt ];
        theme = "spaceship";
      };

      shellAliases = {
        "download-audio" = "${pkgs.youtube-dl}/bin/youtube-dl --extract-audio --audio-format mp3";
        "emacs-nox" = "${pkgs.emacs}/bin/emacs --no-window-system";
        "nixos-generate-iso" = ''
          nix-build "<nixpkgs/nixos>" \
            -A config.system.build.isoImage \
            -I nixos-config=${HOME}/Downloads/nixos-configuration/profiles/iso.nix
        '';
        "nixos-generate-vm" = ''
          nix-build "<nixpkgs/nixos>" \
            -A config.system.build.virtualBoxOVA \
            -I nixos-config=${HOME}/Downloads/nixos-configuration/profiles/vm.nix
        '';
      };
    };
  };
}
