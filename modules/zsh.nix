{ config, pkgs, ... }:

{
  programs.command-not-found.enable = false;

  programs.zsh.enable = true;
  programs.zsh.interactiveShellInit = ''
    setopt histignorespace

    source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh
    # Use emacs key bindings
    bindkey -e
  '';

  imports = [
    {
      programs.zsh.interactiveShellInit = ''
        alias s_ssh="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeychecking=no"
      '';
    }

    {
      programs.zsh.interactiveShellInit =
        let
          system = "nixosConfigurations.${config.networking.hostName}";
        in
        ''
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

            nix build "$@" --out-link "$outLink" "$flakePath#${system}.config.system.build.toplevel"

            if [ $? -ne 0 ]; then
              echo "Unexpected error while building the configuration"
              rm -r "$tmpdir"
              return 1
            fi

            echo "$outLink"
          }

          nix-remote-build-system () {
            local remoteBuilder
            local flakePath="${./..}"

            local outputJson

            remoteBuilder="$1"
            shift

            if [ ! -z "$1" ]; then
              flakePath="$1"
              shift
            fi

            outputJson=$(
              NIX_SSHOPTS="-o UserKnownHostsFile=/dev/null -o StrictHostKeychecking=no" \
                nix build --eval-store auto --store "$remoteBuilder" --builders "" --max-jobs 0 --json \
                  "$@" "$flakePath#${system}.config.system.build.toplevel"
            )

            if [ $? -ne 0 ]; then
              echo "Unexpected error while building the configuration"
              return 1
            fi

            echo "$outputJson"

            outputDerivation=$(echo "$outputJson" | ${pkgs.jq.bin}/bin/jq -r '.[0].outputs.out')

            NIX_SSHOPTS="-o UserKnownHostsFile=/dev/null -o StrictHostKeychecking=no" \
              nix copy --no-check-sigs --from "$remoteBuilder" "$outputDerivation"
          }
        '';
    }
  ];
}
