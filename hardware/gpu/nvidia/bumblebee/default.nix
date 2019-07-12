{ config, pkgs, ... }:

let
  inherit (config.boot.kernelPackages) nvidia_x11_beta;
  naps = pkgs.writeShellScriptBin "naps" (builtins.readFile ./naps);
in with config.nixos; {
  imports =
    [
      ../polyfill.nix
    ];

  environment.systemPackages = [ naps ];

  hardware.bumblebee = {
    enable = true;
    package = nvidia_x11_beta;
    pmMethod = "none";
  };

  nixpkgs.overlays = [
    (self: super: with self.pkgs; {
      bumblebee = (super.bumblebee.override {
        nvidia_x11 = nvidia_x11_beta;
      }).overrideAttrs (oldAttrs: {
        src = builtins.fetchGit {
          url = "https://github.com/Bumblebee-Project/Bumblebee";
          ref = "develop";
        };

        patchPhase = ''
          patch -p1 -i ${./983.patch}
          patch -p1 -i ${./module-unload.patch}
          patch -p1 -i ${./nixos.patch}
        '';

        configureFlags = oldAttrs.configureFlags ++ [
          "CONF_BRIDGE=virtualgl"
          "CONF_PRIMUS_LD_PATH=${primusLib}/lib"
        ];

        nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [ autoreconfHook ];
      });

      primusLib = super.primusLib.override {
        nvidia_x11 = nvidia_x11_beta;
      };
    })
  ];

  security.sudo.extraConfig = ''
    ${settings.system.user} ALL=(ALL:ALL) NOPASSWD: ${naps}/bin/naps
  '';
}
