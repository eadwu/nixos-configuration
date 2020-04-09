{
  edition = 201909;

  inputs.nixpkgs = { type = "github"; owner = "eadwu"; repo = "nixpkgs"; ref = "develop"; };
  inputs.external = { type = "github"; owner = "eadwu"; repo = "flakes"; };
  inputs.home-manager = { type = "github"; owner = "eadwu"; repo = "home-manager"; };

  inputs.external.inputs.nixpkgs.follows = "/nixpkgs";
  inputs.home-manager.inputs.nixpkgs.follows = "/nixpkgs";

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: with nixpkgs.lib; {

    isoImage = (nixosSystem rec {
      system = "x86_64-linux";
      modules = singleton (import ./profiles/iso.nix);
    }).config.system.build.isoImage;

    nixosConfigurations.terrenus = nixosSystem rec {
      system = "x86_64-linux";
      # TODO: Figure out why _module.args gives infinite recursion
      specialArgs.flakes = genAttrs
        (builtins.attrNames inputs)
        (flake:
          (if (inputs.${flake} ? packages && inputs.${flake}.packages ? ${system})
            then inputs.${flake}.packages.${system}
            else {})
          // {
            inherit (inputs.${flake}) nixosModules;
            path = inputs.${flake};
          });

      modules =
        singleton ({ ... }: {
          imports = singleton ./machines/terrenus;

          nixpkgs.overlays = singleton (inputs.external.overlays system);

          system.stateVersion = "19.03";
          system.configurationRevision = if (self ? rev)
            then self.rev
            else "-git_dirty";
        });
    };

  };
}
