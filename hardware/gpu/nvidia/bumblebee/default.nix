{ config, pkgs, ... }:

let
  inherit (config.boot.kernelPackages) nvidia_x11_beta;
  settings = import ../../../../settings.nix;

  naps = pkgs.writeShellScriptBin "naps" (builtins.readFile ./naps);
in with settings; {
  imports =
    [
      ../polyfill.nix
    ];

  environment = {
    systemPackages = [
      naps
    ];
  };

  hardware = {
    bumblebee = {
      enable = true;
      package = nvidia_x11_beta;
      pmMethod = "none";
    };
  };

  nixpkgs = {
    overlays = [
      (self: super: with self.pkgs; {
        bumblebee = (super.bumblebee.override {
          nvidia_x11 = nvidia_x11_beta;
        }).overrideAttrs (oldAttrs: {
          src = fetchgit {
            url = "https://github.com/Bumblebee-Project/Bumblebee";
            rev = "9695e227756de45249ba98fce7103e446bd10d88";
            sha256 = "0cdcpx6mg51hw4in3vcwx8hjny4s8y20irpqzlrk53x83s52pz9y";
          };

          patchPhase = ''
            patch -p1 -i ${./983.patch}
            patch -p1 -i ${./module-unload.patch}
            patch -p1 -i ${./nixos.patch}
          '';

          configureFlags = oldAttrs.configureFlags
            ++ [
              "CONF_BRIDGE=virtualgl"
              "CONF_PRIMUS_LD_PATH=${primusLib}/lib"
            ];

          nativeBuildInputs = oldAttrs.nativeBuildInputs
            ++ [
              autoreconfHook
            ];
        });

        primusLib = super.primusLib.override {
          nvidia_x11 = nvidia_x11_beta;
        };
      })
    ];
  };

  security = {
    sudo = {
      extraConfig = ''
        ${user} ALL=(ALL:ALL) NOPASSWD: ${naps}/bin/naps
      '';
    };
  };

  services = {
    xserver = {
      videoDrivers = [
        "modesetting"
      ];
    };
  };
}
