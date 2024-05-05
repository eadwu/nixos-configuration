{
  # Flake for compatibility with non-flake commands
  inputs.flake-compat = { type = "github"; owner = "edolstra"; repo = "flake-compat"; flake = false; };

  # Flake Dependencies
  inputs.external = { type = "github"; owner = "eadwu"; repo = "flakes"; inputs.nixpkgs.follows = "/nixpkgs"; };
  inputs.deploy-rs = { type = "github"; owner = "serokell"; repo = "deploy-rs"; };
  inputs.home-manager = { type = "github"; owner = "nix-community"; repo = "home-manager"; inputs.nixpkgs.follows = "/nixpkgs"; };
  inputs.impermanence = { type = "github"; owner = "nix-community"; repo = "impermanence"; };
  inputs.fenix = { type = "github"; owner = "nix-community"; repo = "fenix"; inputs.nixpkgs.follows = "/nixpkgs"; };
  inputs.zig-overlay = { type = "github"; owner = "mitchellh"; repo = "zig-overlay"; inputs.nixpkgs.follows = "/nixpkgs"; };
  inputs.microvm = { type = "github"; owner = "eadwu"; repo = "microvm.nix"; inputs.nixpkgs.follows = "/nixpkgs"; };

  # Nixpkgs Channels
  inputs.nixpkgs = { type = "github"; owner = "eadwu"; repo = "nixpkgs"; ref = "develop"; };
  inputs.nixos-23_11 = { type = "github"; owner = "NixOS"; repo = "nixpkgs"; ref = "nixos-23.11"; };
  inputs.nixos-23_11-small = { type = "github"; owner = "NixOS"; repo = "nixpkgs"; ref = "nixos-23.11-small"; };
  inputs.nixos-unstable = { type = "github"; owner = "NixOS"; repo = "nixpkgs"; ref = "nixos-unstable"; };
  inputs.nixos-unstable-small = { type = "github"; owner = "NixOS"; repo = "nixpkgs"; ref = "nixos-unstable-small"; };
  inputs.nixpkgs-unstable = { type = "github"; owner = "NixOS"; repo = "nixpkgs"; ref = "nixpkgs-unstable"; };

  # WSL2 Support
  inputs.wsl = { type = "github"; owner = "nix-community"; repo = "NixOS-WSL"; ref = "7e3fc6a99a2c9e6701e2e0d37f1755e29a798b91"; inputs.nixpkgs.follows = "/nixpkgs-unstable"; };
  inputs.mingw-packages = { type = "github"; owner = "msys2"; repo = "MINGW-packages"; ref = "b5b0d4ddfa7d7058b8735e95c92ec6ff65ddbcd0"; flake = false; };

  # Rolling
  # inputs.haumea = { type = "github"; owner = "nix-community"; repo = "haumea"; ref = "v0.2.2"; inputs.nixpkgs.follows = "/nixpkgs"; };
  # inputs.lanzaboote = { type = "github"; owner = "nix-community"; repo = "lanzaboote"; ref = "v0.3.0"; inputs.nixpkgs.follows = "/nixpkgs"; };
  # inputs.ytdl = { type = "github"; owner = "ytdl-org"; repo = "ytdl-nightly"; ref = "2023.08.07"; flake = false; };

  # inputs.hyprland = { type = "github"; owner = "hyprwm"; repo = "Hyprland"; ref = "refs/tags/v0.30.0"; inputs.nixpkgs.follows = "/nixpkgs"; };
  # inputs.nvidia-container-toolkit = { type = "github"; owner = "NVIDIA"; repo = "nvidia-container-toolkit"; ref = "refs/tags/v1.13.5"; flake = false; };
  # inputs.libnvidia-container = { type = "github"; owner = "NVIDIA"; repo = "libnvidia-container"; ref = "refs/tags/v1.13.5"; flake = false; };
  # inputs.eww = { type = "github"; owner = "elkowar"; repo = "eww"; ref = "25e50eda46379bccd8a7887c18ee35833e0460e8"; flake = false; };
  # inputs.mesa = { type = "git"; url = "https://gitlab.freedesktop.org/mesa/mesa.git"; ref = "refs/tags/mesa-22.3.4"; flake = false; };
  # inputs.DirectX-Headers = { type = "github"; owner = "microsoft"; repo = "DirectX-Headers"; ref = "v1.608.2"; flake = false; };
  # inputs.pipewire = { type = "github"; owner = "pipewire"; repo = "pipewire"; ref = "0.3.60"; flake = false; };
  # inputs.victoriametrics = { type = "github"; owner = "VictoriaMetrics"; repo = "VictoriaMetrics"; ref = "refs/tags/v1.100.0"; flake = false; };

  # inputs.cronie = { type = "github"; owner = "cronie-crond"; repo = "cronie"; ref = "refs/tags/cronie-1.6.1"; flake = false; };

  outputs = { self, nixpkgs, deploy-rs, ... }@inputs: with nixpkgs.lib; let
    baseSystem = { system ? "x86_64-linux", modules ? [ ], includeExternalOverlay ? true }@config: nixosSystem {
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

        nixosModules = foldl recursiveUpdate { } (map (flake: flake.nixosModules or { }) (attrValues flakes));
      };

      modules =
        (optional includeExternalOverlay { nixpkgs.overlays = mkBefore (builtins.attrValues inputs.external.overlays); })
        ++
        [
          inputs.external.nixosModules.adblock
          inputs.external.nixosModules.sysfs
          { nixpkgs.overlays = [
            inputs.microvm.overlay (final: prev: { inherit system; })
            inputs.fenix.overlays.default
            inputs.zig-overlay.overlays.default
          ]; }

          { environment.systemPackages = [ inputs.zig-overlay.packages.x86_64-linux.master ]; }
        ]
        ++
        [
          {
            _module.args.system = system;
          }

          {
            nixpkgs.overlays = mkBefore [
              (final: prev: {
                inherit (final._channels.nixos-23_11)
                  # Broken builds on `nixpkgs`
                  ark buku krita
                  # "Expensive" builds
                  libreoffice-fresh
                  rnnoise-plugin

                  lean poetry ir

                  k3s
                  ;

                inherit (final._channels.nixos-23_11-small)
                  thermald
                  # thunderbird
                  # "Expensive" builds
                  R rstudio
                  git-lfs

                  wrangler

                  vulkan-validation-layers

                  vimPlugins

                  knot-resolver
                  ;

                inherit (final._channels.nixos-unstable)
                  # Builds that have a high chance of not being broken
                  mailutils nix-prefetch-scripts
                  # "Expensive" builds
                  nodejs chromium lsp-plugins nodePackages pinentry carla
                  woeusb-ng mongodb
                  thunderbird terraform
                  texlive
                  ## Java stuff so openjdk doesn't get built
                  sbt maven scala openjdk ghidra-bin epubcheck bfg-repo-cleaner
                  openjdk8
                  # Other
                  qemu

                  element-desktop

                  noto-fonts noto-fonts-cjk-sans noto-fonts-cjk-serif noto-fonts-color-emoji
                  noto-fonts-emoji-blob-bin noto-fonts-lgc-plus noto-fonts-monochrome-emoji
                  ;

                inherit (final._channels.nixpkgs-unstable)
                  hplip docker evince
                  # "Expensive" builds so wait for a probable cache hit scenario
                  gimp blender inkscape

                  # inherit build definition
                  crosvm sommelier
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
                  [ "nixos-23_11" "nixos-23_11-small" "nixos-unstable" "nixos-unstable-small" "nixpkgs-unstable" "nixpkgs" ]
                  (channel: import inputs.${channel} { inherit system; config.allowUnfree = true; });
              })
            ];
          }

          {
            nixpkgs.overlays = mkAfter [
              (
                final: prev: with final.pkgs; {
                  # eww = prev.eww.overrideAttrs (
                  #   oldAttrs:
                  #   rec {
                  #     version = builtins.substring 0 8 inputs.eww.lastModifiedDate;
                  #     src = inputs.eww;
                  #   }
                  # );

                  picom = prev.picom.overrideAttrs (
                    oldAttrs: {
                      # version = "2022-01-27";

                      # src = fetchFromGitHub {
                      #   owner = "yshui";
                      #   repo = "picom";
                      #   rev = "3b9af145f0275edf6c54286e5f26e8b269835a6b";
                      #   sha256 = "sha256-EwWkFLjvsixRB/WtG7R1PB2pQiS/gU4VuAxpyekE9rA=";
                      # };
                    }
                  );

                  # youtube-dl = (prev.youtube-dl.overrideAttrs (oldAttrs: {
                  #   version = builtins.substring 0 8 inputs.ytdl;
                  #   src = inputs.ytdl;
                  # }));

                  # victoriametrics = (prev.victoriametrics.overrideAttrs (oldAttrs: {
                  #   version = builtins.substring 0 8 inputs.victoriametrics;
                  #   src = inputs.victoriametrics;
                  # }));

                  vivaldi-snapshot = (prev.vivaldi-snapshot.override {
                    proprietaryCodecs = false;
                  }).overrideAttrs (
                    oldAttrs:
                    rec {
                      # version = "6.4.3152.3";

                      # src = fetchurl {
                      #   url = "https://downloads.vivaldi.com/snapshot/vivaldi-snapshot_${version}-1_amd64.deb";
                      #   sha256 = "1nzhfr7d6gsi0j4kji1mc4c4zwkfb8bfh0vidlqrfgzij7mi8clr";
                      # };

                      # --ozone-platform-hint=auto
                      # postInstall = (oldAttrs.postInstall or "") + ''
                      #   wrapProgram $out/bin/vivaldi \
                      #     --append-flags "--enable-features=UseOzonePlatform" \
                      #     --append-flags "--ozone-platform=wayland"
                      # '';
                    }
                  );

                  vscode-insiders = prev.vscode-insiders.overrideAttrs (
                    oldAttrs:
                    rec {
                      # pname = "vscode-insiders";
                      # version = "1667540698";

                      # src = fetchurl {
                      #   url = "https://az764295.vo.msecnd.net/insider/e764c5b816a99eb8673b2fc4fc028827f202872f/code-insider-x64-1667540698.tar.gz";
                      #   sha256 = "074zjbfw9x7fhl5c4hbklmcgvkpkcxamfn6kb9gsgngi251i3nxc";
                      # };

                      # postInstall = (oldAttrs.postInstall or "") + ''
                      #   wrapProgram $out/bin/code-insiders \
                      #     --append-flags "--enable-features=UseOzonePlatform" \
                      #     --append-flags "--ozone-platform=wayland"
                      # '';
                    }
                  );

                  # pipewire = prev.pipewire.overrideAttrs (
                  #   oldAttrs:
                  #   rec {
                  #     version = builtins.substring 0 8 inputs.pipewire.lastModifiedDate;
                  #     src = inputs.pipewire;
                  #   }
                  # );

                  # libva-minimal = prev.libva-minimal.overrideAttrs (
                  #   oldAttrs:
                  #   rec {
                  #     version = builtins.substring 0 8 inputs.libva.lastModifiedDate;
                  #     src = inputs.libva;
                  #   }
                  # );

                  # libva-utils = prev.libva-utils.overrideAttrs (
                  #   oldAttrs:
                  #   rec {
                  #     version = builtins.substring 0 8 inputs.libva-utils.lastModifiedDate;
                  #     src = inputs.libva-utils;
                  #   }
                  # );

                }
              )
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

    # isoImage = (nixpkgs.lib.nixosSystem {
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

    nixosConfigurations.vm = baseSystem rec {
      modules =
        [
          ({ ... }: {
            system.stateVersion = "23.11";
            system.configurationRevision = mkIf (self ? rev) self.rev;
          })

          ({ options, pkgs, ... }: {
            # Adds terminus_font for people with HiDPI displays
            console.packages = options.console.packages.default ++ [ pkgs.terminus_font ];

            services.xserver.enable = true;
            services.xserver = {
              desktopManager.plasma5 = {
                enable = true;
              };

              # Automatically login as nixos.
              displayManager = {
                sddm.enable = true;
                autoLogin = {
                  enable = true;
                  user = "nixos";
                };
              };
            };

            # KDE complains if power management is disabled (to be precise, if
            # there is no power management backend such as upower).
            powerManagement.enable = true;

            # Enable sound in graphical iso's.
            hardware.pulseaudio.enable = true;

            # VM guest additions to improve host-guest interaction
            services.spice-vdagentd.enable = true;
            services.qemuGuest.enable = true;
            virtualisation.vmware.guest.enable = pkgs.stdenv.hostPlatform.isx86;
            virtualisation.hypervGuest.enable = true;
            services.xe-guest-utilities.enable = pkgs.stdenv.hostPlatform.isx86;
            # The VirtualBox guest additions rely on an out-of-tree kernel module
            # which lags behind kernel releases, potentially causing broken builds.
            virtualisation.virtualbox.guest.enable = false;

            # Enable plymouth
            boot.plymouth.enable = true;

            environment.defaultPackages = with pkgs; [
              # Include gparted for partitioning disks.
              gparted

              # Include some editors.
              vim
              nano

              # Include some version control tools.
              git
              rsync

              # Firefox for reading the manual.
              firefox

              # Graphical text editor
              kate

              glxinfo
            ];
          })
        ];
    };

    nixosConfigurations.compage = baseSystem rec {
      modules =
        [
          ({ ... }: {
            imports = [ ./machines/compage ];

            system.stateVersion = "23.05";
            system.configurationRevision = mkIf (self ? rev) self.rev;
          })
        ];
    };

    nixosConfigurations.architect = baseSystem rec {
      modules =
        [
          ({ ... }: {
            imports = [ inputs.wsl.nixosModules.wsl ./machines/architect ];

            system.stateVersion = "22.05";
            system.configurationRevision = mkIf (self ? rev) self.rev;
          })
        ];
    };

    nixosConfigurations.caelus = baseSystem rec {
      modules =
        [
          ({ ... }: {
            imports = [ inputs.wsl.nixosModules.wsl ./machines/caelus ];

            system.stateVersion = "22.05";
            system.configurationRevision = mkIf (self ? rev) self.rev;
          })
        ];
    };

    nixosConfigurations.cratis = baseSystem rec {
      modules =
        [
          ({ ... }: {
            imports = [ inputs.wsl.nixosModules.wsl ./machines/cratis ];

            system.stateVersion = "22.05";
            system.configurationRevision = mkIf (self ? rev) self.rev;
          })
        ];
    };

    nixosConfigurations.abyssus = baseSystem rec {
      modules =
        [
          ({ ... }: {
            imports = [ inputs.wsl.nixosModules.wsl ./machines/abyssus ];

            system.stateVersion = "22.05";
            system.configurationRevision = mkIf (self ? rev) self.rev;
          })
        ];
    };

    nixosConfigurations.concentus = baseSystem rec {
      modules =
        [
          ({ ... }: {
            imports = [ inputs.wsl.nixosModules.wsl ./machines/concentus ];

            system.stateVersion = "22.05";
            system.configurationRevision = mkIf (self ? rev) self.rev;
          })
        ];
    };

    nixosConfigurations.aspectum = baseSystem rec {
      modules =
        [
          ({ ... }: {
            imports = [ inputs.wsl.nixosModules.wsl ./machines/aspectum ];

            system.stateVersion = "22.05";
            system.configurationRevision = mkIf (self ? rev) self.rev;
          })
        ];
    };

    nixosConfigurations.solus = baseSystem rec {
      modules =
        [
          ({ ... }: {
            imports = [ ./machines/solus ];

            system.stateVersion = "22.05";
            system.configurationRevision = mkIf (self ? rev) self.rev;
          })
        ];
    };

    nixosConfigurations.testbed = baseSystem rec {
      modules =
        [
          ({ lib, options, config, pkgs, modulesPath, ... }: {
            imports = [ inputs.wsl.nixosModules.wsl ./configurations/wsl ];

            wsl.defaultUser = "testbed";
            networking.hostName = config.wsl.defaultUser;

            time.timeZone = "America/Los_Angeles";

            system.stateVersion = "22.05";
            system.configurationRevision = mkIf (self ? rev) self.rev;
          })
        ];
    };

    nixosConfigurations.terrenus = baseSystem rec {
      modules =
        [
          ({ ... }: {
            imports = [ ./machines/terrenus ];

            nixpkgs.overlays = [ inputs.rust-overlay.overlays.default ];

            system.stateVersion = "20.03";
            system.configurationRevision = mkIf (self ? rev) self.rev;
          })
        ];
    };

    deploy.nodes = {
      architect = {
        hostname = "localhost";
        profiles.system = {
          user = "root";
          sshUser = "architect";
          sshOpts = [ "-p" "22" ];
          path = deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.architect;
        };
      };

      /*
      caelus = {
        hostname = "localhost";
        profiles.system = {
          user = "root";
          sshUser = "caelus";
          sshOpts = [ "-p" "23" ];
          path = deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.caelus;
        };
      };

      cratis = {
        hostname = "localhost";
        profiles.system = {
          user = "root";
          sshUser = "cratis";
          sshOpts = [ "-p" "24" ];
          path = deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.cratis;
        };
      };

      abyssus = {
        hostname = "localhost";
        profiles.system = {
          user = "root";
          sshUser = "abyssus";
          sshOpts = [ "-p" "25" ];
          path = deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.abyssus;
        };
      };

      concentus = {
        hostname = "localhost";
        profiles.system = {
          user = "root";
          sshUser = "concentus";
          sshOpts = [ "-p" "26" ];
          path = deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.concentus;
        };
      };

      aspectum = {
        hostname = "localhost";
        profiles.system = {
          user = "root";
          sshUser = "aspectum";
          sshOpts = [ "-p" "27" ];
          path = deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.aspectum;
        };
      };
      */
    };

    # This is highly advised, and will prevent many possible mistakes
    checks = builtins.mapAttrs (system: deployLib: deployLib.deployChecks self.deploy) deploy-rs.lib;

  };
}
