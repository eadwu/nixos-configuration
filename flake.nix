{
  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs = { self, nixpkgs, ... }@inputs: with nixpkgs.lib; {

    nixosConfigurations.compage = nixosSystem rec {
      modules =
        [
          ({ lib, ... }: {
            imports = [ ./machines/compage ];

            system.stateVersion = "24.05";
            system.configurationRevision = lib.mkIf (self ? rev) self.rev;
          })
        ];
    };

  };
}
