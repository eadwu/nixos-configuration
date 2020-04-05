{ config, pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;
      interactiveShellInit = ''
        setopt histignorespace

        nix-clean () {
          nix-env -p /nix/var/nix/profiles/system --delete-generations "$1"
          nix-store --gc
          nix-channel --update
          nix-env -u --always
          for link in /nix/var/nix/gcroots/auto/*; do rm $(readlink "$link"); done
          nix-collect-garbage --delete-older-than "$1"
        }

        nix-derive-output () {
          nix-store --query --requisites --include-outputs $(nix-store --query --deriver "$1")
        }

        nix-build-system () {
          if [ $# -lt 1 ]; then
            echo "Expected at least one argument, nix-build-system <flakePath>"
            exit 1
          fi

          flakePath="$1"
          outLink="$(mktemp -d)/system"

          shift
          nix build "$@" --out-link "$outLink" \
            --no-update-lock-file --no-write-lock-file \
            "$flakePath#nixosConfigurations.${config.networking.hostName}".config.system.build.toplevel
          printf "$outLink"
        }
      '';

      ohMyZsh = {
        enable = true;
        customPkgs = with pkgs; [ spaceship-prompt ];
        theme = "spaceship";
      };

      shellAliases = {
        download-audio = "${pkgs.youtube-dl}/bin/youtube-dl --extract-audio --audio-format mp3";
        emacs-nox = "${pkgs.emacs}/bin/emacs --no-window-system";
      };
    };
  };
}
