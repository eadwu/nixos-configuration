{ config, pkgs, ... }:

with import <nixpkgs> { };

let
  settings = import ../settings.nix;

  spaceship-prompt = stdenv.mkDerivation rec {
    name = "spaceship-prompt-${version}";
    version = "2018-09-11";

    src = pkgs.fetchgit {
      url = "https://github.com/denysdovhan/spaceship-prompt";
      rev = "35ac6cd1e07b1d3fb44d605d628f6e6c4073b7ea";
      sha256 = "0hwl44qqa97172rndiv5fg59v1rzyr5msx5l17zgqrfhad4jwpwg";
    };

    dontBuild = true;

    installPhase = ''
      mkdir -p $out

      cp -r lib $out
      cp -r sections $out
      cp spaceship.zsh $out/prompt_spaceship_setup
    '';
  };
in with settings; {
  programs = {
    zsh = {
      enable = true;
      interactiveShellInit = ''
        fpath+=(${spaceship-prompt})
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
      promptInit = ''
        autoload -U promptinit
        promptinit
        prompt spaceship
      '';
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
