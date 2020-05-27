{
  inputs.nixpkgs = { type = "github"; owner = "eadwu"; repo = "nixpkgs"; ref = "develop"; };
  inputs.external = { type = "github"; owner = "eadwu"; repo = "flakes"; };
  inputs.home-manager = { type = "github"; owner = "eadwu"; repo = "home-manager"; ref = "bqv-flakes"; };

  inputs.external.inputs.nixpkgs.follows = "/nixpkgs";
  inputs.home-manager.inputs.nixpkgs.follows = "/nixpkgs";

  outputs = { self, nixpkgs, ... }@inputs: with nixpkgs.lib; let
    baseSystem = { system ? "x86_64-linux", modules ? [] }@config: nixosSystem rec {
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
        (singleton ({ nixpkgs.overlays = mkBefore (singleton inputs.external.overlay); }))
        ++ config.modules;
    };
  in {
    isoImage = (baseSystem {
      system = "x86_64-linux";
      modules = singleton (import ./profiles/iso.nix);
    }).config.system.build.isoImage;

    sdImage = (baseSystem {
      system = "aarch64-linux";
      modules = singleton (import ./profiles/sd-image.nix);
    }).config.system.build.sdImage;

    crossSdImage = (baseSystem {
      modules = singleton (import ./profiles/cross-sd-image.nix);
    }).config.system.build.sdImage;

    ovaImage = (baseSystem {
      modules = singleton (import ./profiles/vm.nix);
    }).config.system.build.virtualBoxOVA;

    nixosConfigurations.terrenus = baseSystem rec {
      modules =
        singleton ({ ... }: {
          imports = singleton ./machines/terrenus;

          # nix.nixPath = singleton "nixos-config=${self}/machines/terrenus";
          system.stateVersion = "19.03";
          system.configurationRevision = mkIf (self ? rev) self.rev;
        });
    };

  };
}
