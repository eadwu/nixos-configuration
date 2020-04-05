{
  edition = 201909;

  inputs.nixpkgs.url = "github:eadwu/nixpkgs/develop";
  inputs.home-manager.url = "github:eadwu/home-manager";
  inputs.external.url = "github:eadwu/flakes";

  inputs.home-manager.inputs.nixpkgs.url = "github:eadwu/nixpkgs/develop";
  inputs.external.inputs.nixpkgs.url = "github:eadwu/nixpkgs/develop";

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {

    nixosConfigurations.terrenus = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";
      # TODO: Figure out why _module.args gives infinite recursion
      specialArgs.flakes = nixpkgs.lib.genAttrs
        (builtins.attrNames inputs)
        (flake:
          (if (inputs.${flake} ? packages)
            then inputs.${flake}.packages.${system}
            else {})
          // {
            inherit (inputs.${flake}) nixosModules;
            path = inputs.${flake};
          });

      modules =
        nixpkgs.lib.singleton ({ ... }: {
          imports = [ ./machines/terrenus ];

          system.stateVersion = "19.03";
          system.configurationRevision = if (self ? rev)
            then self.rev
            else "-git_dirty";
        });
    };

  };
}
