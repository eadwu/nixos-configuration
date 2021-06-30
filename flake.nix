{
  inputs.flake-compat = { type = "github"; owner = "edolstra"; repo = "flake-compat"; flake = false; };

  inputs.nixpkgs = { type = "github"; owner = "eadwu"; repo = "nixpkgs"; ref = "develop"; };
  inputs.nixos-stable = { type = "github"; owner = "NixOS"; repo = "nixpkgs"; ref = "nixos-20.09"; };
  inputs.nixos-stable-small = { type = "github"; owner = "NixOS"; repo = "nixpkgs"; ref = "nixos-20.09-small"; };
  inputs.nixos-unstable = { type = "github"; owner = "NixOS"; repo = "nixpkgs"; ref = "nixos-unstable"; };
  inputs.nixos-unstable-small = { type = "github"; owner = "NixOS"; repo = "nixpkgs"; ref = "nixos-unstable-small"; };
  inputs.nixpkgs-unstable = { type = "github"; owner = "NixOS"; repo = "nixpkgs"; ref = "nixpkgs-unstable"; };
  inputs.external = { type = "github"; owner = "eadwu"; repo = "flakes"; inputs.nixpkgs.follows = "/nixpkgs"; };
  inputs.home-manager = { type = "github"; owner = "nix-community"; repo = "home-manager"; inputs.nixpkgs.follows = "/nixpkgs"; };
  inputs.impermanence = { type = "github"; owner = "nix-community"; repo = "impermanence"; };
  inputs.rust-overlay = { type = "github"; owner = "oxalica"; repo = "rust-overlay"; inputs.nixpkgs.follows = "/nixpkgs"; };

  outputs = { self, nixpkgs, ... }@inputs: with nixpkgs.lib; let
    baseSystem = { system ? "x86_64-linux", modules ? [ ], includeExternalOverlay ? true }@config: nixosSystem {
      inherit system;
      # TODO: Figure out why _module.args gives infinite recursion
      specialArgs = rec {
        flakes = genAttrs (builtins.attrNames inputs)
          (flake:
            (if (inputs.${flake} ? packages && inputs.${flake}.packages ? ${system})
            then inputs.${flake}.packages.${system}
            else { })
            // {
              path = inputs.${flake};
              nixosModules = inputs.${flake}.nixosModules or { };
            });

        nixosModules = foldl recursiveUpdate { } (map (flake: flake.nixosModules or { }) (attrValues flakes));
      };

      modules =
        (optional includeExternalOverlay { nixpkgs.overlays = mkBefore (builtins.attrValues inputs.external.overlays); })
        ++
        [
          {
            _module.args.system = system;
          }

          {
            nixpkgs.overlays = mkBefore [
              (final: prev: {
                inherit (final._channels.nixos-stable)
                  # Broken builds on `nixpkgs`
                  ark buku krita
                  ;

                inherit (final._channels.nixos-stable-small)
                  # "Expensive" builds
                  rstudio libreoffice-fresh
                  ;

                inherit (final._channels.nixos-unstable)
                  # Builds that have a high chance of not being broken
                  mailutils nix-prefetch-scripts
                  # "Expensive" builds
                  chromium lsp-plugins
                  ;

                inherit (final._channels.nixpkgs-unstable)
                  hplip docker evince
                  # "Expensive" builds so wait for a probable cache hit scenario
                  gimp julia blender inkscape thunderbird noto-fonts-emoji
                  ## Java stuff so openjdk doesn't get built
                  sbt maven openjdk ghidra-bin epubcheck bfg-repo-cleaner
                  ;

                inherit (final._channels.nixpkgs)
                  ;

                # Defer to `nixpkgs-unstable` so that there's a greater chance for a cache hit, not a top priority for rebuilds
                jetbrains = prev.jetbrains // { jdk = final._channels.nixpkgs-unstable.jetbrains.jdk; };

                # Aliases for default derivations without causing rebuilds
                _aliases = {
                  git = final._channels.nixos-unstable.gitFull;
                };

                _channels = genAttrs
                  [ "nixos-stable" "nixos-stable-small" "nixos-unstable" "nixos-unstable-small" "nixpkgs-unstable" "nixpkgs" ]
                  (channel: import inputs.${channel} { inherit system; config.allowUnfree = true; });
              })
            ];
          }
        ]
        ++ config.modules;
    };
  in
  {

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
        [
          ({ ... }: {
            imports = [ ./machines/terrenus ];

            nixpkgs.overlays = [ inputs.rust-overlay.overlay ];

            system.stateVersion = "20.03";
            system.configurationRevision = mkIf (self ? rev) self.rev;
          })
        ];
    };

  };
}
