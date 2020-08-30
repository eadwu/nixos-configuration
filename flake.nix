{
  inputs.nixpkgs = { type = "github"; owner = "eadwu"; repo = "nixpkgs"; ref = "develop"; };
  inputs.nixos-unstable = { type = "github"; owner = "NixOS"; repo = "nixpkgs-channels"; ref = "nixos-unstable"; };
  inputs.nixpkgs-unstable = { type = "github"; owner = "NixOS"; repo = "nixpkgs-channels"; ref = "nixpkgs-unstable"; };
  inputs.external = { type = "github"; owner = "eadwu"; repo = "flakes"; };
  inputs.home-manager = { type = "github"; owner = "eadwu"; repo = "home-manager"; ref = "bqv-flakes"; };

  inputs.external.inputs.nixpkgs.follows = "/nixpkgs";
  inputs.home-manager.inputs.nixpkgs.follows = "/nixpkgs";

  outputs = { self, nixpkgs, ... }@inputs: with nixpkgs.lib; let
    baseSystem = { system ? "x86_64-linux", modules ? [], includeExternalOverlay ? true }@config: nixosSystem rec {
      inherit system;
      # TODO: Figure out why _module.args gives infinite recursion
      specialArgs = rec {
        inherit system;

        flakes = genAttrs (builtins.attrNames inputs)
          (flake:
            (if (inputs.${flake} ? packages && inputs.${flake}.packages ? ${system})
              then inputs.${flake}.packages.${system}
              else {})
            // {
              path = inputs.${flake};
              nixosModules = inputs.${flake}.nixosModules or {};
            });

        nixosModules = foldl recursiveUpdate {} (map (flake: flake.nixosModules or {}) (attrValues flakes));
      };

      modules =
        (optional includeExternalOverlay { nixpkgs.overlays = mkBefore [ inputs.external.overlay ]; })
        ++ [{
          nixpkgs.overlays = mkBefore [
            (final: prev: {
              inherit (final._channels.nixos-unstable)
                ark rstudio buku pinentry;

              inherit (final._channels.nixpkgs-unstable)
                rust-analyzer;

              _channels = genAttrs
                [ "nixos-unstable" "nixpkgs-unstable" ]
                (channel: import inputs.${channel} { inherit system; config.allowUnfree = true; });
            })
          ];
        }]
        ++ config.modules;
    };
  in {

    nixosModules = {
      settings = import ./options/settings;
      sddm-sugar-dark = import ./options/sddm-sugar-dark.nix;
    };

    isoImage = (baseSystem {
      system = "x86_64-linux";
      modules = [ (import ./profiles/iso.nix) ];
    }).config.system.build.isoImage;

    sdImage = (baseSystem {
      system = "aarch64-linux";
      modules = [ (import ./profiles/sd-image.nix) ];
    }).config.system.build.sdImage;

    crossSdImage = (baseSystem {
      includeExternalOverlay = false;
      modules = [ (import ./profiles/cross-sd-image.nix) ];
    }).config.system.build.sdImage;

    ovaImage = (baseSystem {
      modules = [ (import ./profiles/vm.nix) ];
    }).config.system.build.virtualBoxOVA;

    nixosConfigurations.terrenus = baseSystem rec {
      modules =
        [ ({ ... }: {
          imports = [ ./machines/terrenus ];

          system.stateVersion = "20.03";
          system.configurationRevision = mkIf (self ? rev) self.rev;
        }) ];
    };

  };
}
