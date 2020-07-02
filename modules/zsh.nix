{ config, pkgs, ... }:

{
  programs = {
    command-not-found.enable = false;

    zsh = {
      enable = true;

      interactiveShellInit = let
        system = "nixosConfigurations.${config.networking.hostName}";
      in ''
        setopt histignorespace
        source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh
        # Use emacs key bindings
        bindkey -e

        rebuild () {
          local cmd="--help"

          if [ ! -z "$1" ]; then
            cmd="$1"
            shift
          fi

          nix run "$@" -vv "$flakePath#${system}.config.system.build.toplevel" -c switch-to-configuration "$cmd"
        }

        nix-clean () {
          nix-env -p /nix/var/nix/profiles/system --delete-generations old
          nix-store --gc
          for link in /nix/var/nix/gcroots/auto/*; do rm $(readlink "$link"); done
          nix-collect-garbage --delete-old
        }

        nix-derive-output () {
          nix-store --query --requisites --include-outputs $(nix-store --query --deriver "$1")
        }

        nix-build-system () {
          local flakePath="${./..}"
          local tmpdir
          local outLink

          tmpdir="$(mktemp -d)"
          outLink="$tmpdir/system"

          if [ ! -z "$1" ]; then
            flakePath="$1"
            shift
          fi

          nix build "$@" --out-link "$outLink" --keep-going --recreate-lock-file \
            "$flakePath#${system}.config.system.build.toplevel"

          if [ $? -ne 0 ]; then
            echo "Unexpected error while building the configuration"
            rm -r "$tmpdir"
            return 1
          fi

          echo "$outLink"
        }

        nixos-option () {
          local flakePath="${./..}"
          local option

          if [ ! -z "$2" ]; then
            flakePath="$1"
            shift
          fi

          option="$1"
          shift

          nix eval "$@" --recreate-lock-file "$flakePath#${system}.config.$option"
        }
      '';

      shellAliases = {
        download-audio = "${pkgs.youtube-dl}/bin/youtube-dl --extract-audio --audio-format mp3";
        emacs-nox = "${pkgs.emacs}/bin/emacs --no-window-system";
      };
    };
  };
}
