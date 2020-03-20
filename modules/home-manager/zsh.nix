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
          cachix push sys \
            $(nix-derive-output $(nix-build "<nixpkgs/nixos>" \
              -A config.system.build.toplevel \
              --no-out-link))
        }
      '';
    };
  };
}
