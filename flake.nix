{
  # Flake for compatibility with non-flake commands
  inputs.flake-compat = { type = "github"; owner = "edolstra"; repo = "flake-compat"; flake = false; };

  # External Modules
  inputs.home-manager = { type = "github"; owner = "nix-community"; repo = "home-manager"; inputs.nixpkgs.follows = "/nixpkgs"; };
  inputs.impermanence = { type = "github"; owner = "nix-community"; repo = "impermanence"; };

  # Package Set Modifiers
  inputs.external = { type = "github"; owner = "eadwu"; repo = "flakes"; inputs.nixpkgs.follows = "/nixpkgs"; };
  inputs.fenix = { type = "github"; owner = "nix-community"; repo = "fenix"; inputs.nixpkgs.follows = "/nixpkgs"; };
  inputs.zig-overlay = { type = "github"; owner = "mitchellh"; repo = "zig-overlay"; inputs.nixpkgs.follows = "/nixpkgs"; };

  # Nixpkgs Channels
  inputs.nixpkgs = { type = "github"; owner = "eadwu"; repo = "nixpkgs"; ref = "develop"; };
  inputs.nixos-24_05 = { type = "github"; owner = "NixOS"; repo = "nixpkgs"; ref = "nixos-24.05"; };
  inputs.nixos-24_05-small = { type = "github"; owner = "NixOS"; repo = "nixpkgs"; ref = "nixos-24.05-small"; };
  inputs.nixos-unstable = { type = "github"; owner = "NixOS"; repo = "nixpkgs"; ref = "nixos-unstable"; };
  inputs.nixos-unstable-small = { type = "github"; owner = "NixOS"; repo = "nixpkgs"; ref = "nixos-unstable-small"; };
  inputs.nixpkgs-unstable = { type = "github"; owner = "NixOS"; repo = "nixpkgs"; ref = "nixpkgs-unstable"; };

  outputs = { self, nixpkgs, ... }@inputs: with nixpkgs.lib; let
    baseSystem = { system ? "x86_64-linux", modules ? [ ] }@config: nixosSystem {
      inherit system;

      # TODO: Figure out why _module.args gives infinite recursion
      specialArgs = rec {
        flakes = genAttrs (builtins.attrNames inputs)
          (flake:
            inputs.${flake}
            // (if (inputs.${flake} ? packages && inputs.${flake}.packages ? ${system})
            then inputs.${flake}.packages.${system}
            else { })
            // {
              version = builtins.substring 0 8 inputs.${flake};
              path = inputs.${flake};
            });
      };

      modules = [
        inputs.external.nixosModules.adblock
        inputs.external.nixosModules.sysfs
        { nixpkgs.overlays = [ inputs.fenix.overlays.default ]; }
        { nixpkgs.overlays = [ inputs.zig-overlay.overlays.default ]; }
        { nixpkgs.overlays = mkBefore (builtins.attrValues inputs.external.overlays); }

        ({ config, ... }: {
          nixpkgs.overlays = [
            (final: prev: {
              inherit (final._channels.nixos-unstable)
                chromium thunderbird krita inkscape imagemagick
                libreoffice libreoffice-fresh
                intel-compute-runtime;

              _channels = genAttrs
                [ "nixos-24_05" "nixos-24_05-small" "nixos-unstable" "nixos-unstable-small" "nixpkgs-unstable" "nixpkgs" ]
                (channel: import inputs.${channel} { inherit system; config = config.nixpkgs.config; });
            })
          ];
        })
      ] ++ config.modules;
    };
  in
  {

    nixosConfigurations.compage = baseSystem rec {
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
