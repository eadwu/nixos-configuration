{
  edition = 201909;

  inputs.nixpkgs = { type = "github"; owner = "eadwu"; repo = "nixpkgs"; ref = "develop"; };
  inputs.external = { type = "github"; owner = "eadwu"; repo = "flakes"; };
  inputs.home-manager = { type = "github"; owner = "eadwu"; repo = "home-manager"; };

  inputs.external.inputs.nixpkgs.follows = "/nixpkgs";
  inputs.home-manager.inputs.nixpkgs.follows = "/nixpkgs";

  outputs = { self, nixpkgs, ... }@inputs: with nixpkgs.lib; {

    isoImage = (nixosSystem {
      system = "x86_64-linux";
      modules = singleton (import ./profiles/iso.nix);
    }).config.system.build.isoImage;

    sdImage = (nixosSystem {
      system = "aarch64-linux";
      modules = singleton (import ./profiles/sd-image.nix);
    }).config.system.build.sdImage;

    crossSdImage = (nixosSystem {
      modules = singleton (import ./profiles/cross-sd-image.nix);
    }).config.system.build.sdImage;

    ovaImage = (nixosSystem {
      modules = singleton (import ./profiles/vm.nix);
    }).config.system.build.virtualBoxOVA;

    nixosConfigurations.terrenus = nixosSystem rec {
      system = "x86_64-linux";
      # TODO: Figure out why _module.args gives infinite recursion
      specialArgs = rec {
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
        singleton ({ ... }: {
          imports = singleton ./machines/terrenus;

          nixpkgs.overlays = mkBefore (singleton (inputs.external.overlays system));

          system.stateVersion = "19.03";
          system.configurationRevision = if (self ? rev)
            then self.rev
            else "-git_dirty";
        });
    };

  };
}
