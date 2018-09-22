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
      sha256 = "10hqp52c8agxyszwqmrjp6m0v29b0ykqys9ixwl6iawqcwwcwd2c";
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
          nix-channel --update
          nix-env -u --always
          nix-env --delete-generations old
          for link in /nix/var/nix/gcroots/auto/*; do rm $(readlink "$link"); done
          nix-store --gc
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
        "nixos-generate-iso" = ''nix-build "<nixpkgs/nixos>" -A config.system.build.isoImage -I nixos-config=${HOME}/Downloads/nixos-configuration/profiles/iso.nix'';
      };
    };
  };
}
