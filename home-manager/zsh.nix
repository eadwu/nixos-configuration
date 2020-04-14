{ pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;
      enableCompletion = false;

      plugins = [
        { name = "powerline10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme"; }

        { name = "autosuggestions";
          src = pkgs.zsh-autosuggestions;
          file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh"; }

        { name = "fast-syntax-highlighting";
          src = pkgs.zsh-fast-syntax-highlighting;
          file = "share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh"; }

        { name = "powerline10k-config";
          src = ./zsh;
          file = "p10k.zsh"; }
      ];

      initExtra = ''
        ZSH_AUTOSUGGEST_STRATEGY=(history completion)

        # Use emacs key bindings
        bindkey -e

        # [Up-Arrow] - fuzzy find history forward
        autoload -U up-line-or-beginning-search
        zle -N up-line-or-beginning-search
        bindkey "$terminfo[kcuu1]" up-line-or-beginning-search

        # [Down-Arrow] - fuzzy find history backward
        autoload -U down-line-or-beginning-search
        zle -N down-line-or-beginning-search
        bindkey "$terminfo[kcud1]" down-line-or-beginning-search

        docker-build () {
          docker build -t "$1" -f "$1/Dockerfile" .
        }

        docker-clean () {
          docker stop $(docker ps -aq)
          docker rm $(docker ps -aq)
          docker rmi $(docker images -q)
        }

        docker-push-image () {
          docker tag "$1" "''${DOCKER_ID_USER}/$1"
          docker push "''${DOCKER_ID_USER}/$1"
        }

        nix-upload-system () {
          local errno
          local outLink

          outLink=$(nix-build-system "$@")
          errno="$?"

          if [ "$errno" -ne "0" ]; then
            echo "Unexpected error while building the configuration"
            return "$errno"
          fi

          cachix push sys $(nix-derive-output "$outLink")
        }
      '';
    };
  };
}
