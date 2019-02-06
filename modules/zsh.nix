{ pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;
      interactiveShellInit = ''
        setopt histignorespace

        nix-clean () {
          nix-env --delete-generations old
          nix-store --gc
          nix-channel --update
          nix-env -u --always
          for link in /nix/var/nix/gcroots/auto/*; do rm $(readlink "$link"); done
          nix-collect-garbage -d
        }

        nix-build-system () {
          nix build \
            --argstr substituters https://system.cachix.org \
            --argstr trusted-public-keys system.cachix.org-1:LLfVsnv+jMrn/L6gYIaaDthJ+HUHsuhVZ6Kk7tff3dQ= \
            -f "<nixpkgs/nixos>" \
            config.system.build.toplevel
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
