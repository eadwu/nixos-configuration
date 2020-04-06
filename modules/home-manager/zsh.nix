{ ... }:

{
  programs = {
    command-not-found.enable = true;

    zsh = {
      enable = true;
      enableCompletion = false;

      initExtra = ''
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
          flakePath="$1"
          shift

          outLink=$(nix-build-system "$flakePath" "$@")
          errno="$?"

          if [ "$errno" -ne "0" ]; then
            echo "Unexpected error while building the configuration"
            exit "$errno"
          fi

          cachix push sys $(nix-derive-output $outLink)
        }
      '';
    };
  };
}
