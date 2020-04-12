{ pkgs, ... }:

{
  programs = {
    command-not-found.enable = true;

    zsh = {
      enable = true;
      enableCompletion = false;

      plugins = [
        { name = "powerline10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme"; }

        { name = "history-substring-search";
          src = pkgs.zsh-history-substring-search;
          file = "share/zsh-history-substring-search/zsh-history-substring-search.zsh"; }

        { name = "powerline10k-config";
          src = ./zsh;
          file = "p10k.zsh"; }
      ];

      initExtra = ''
        HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="bold"
        HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="none"
        bindkey "$terminfo[kcuu1]" history-substring-search-up
        bindkey "$terminfo[kcud1]" history-substring-search-down

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
