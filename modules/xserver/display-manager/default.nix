{ config, pkgs, ... }:

let
  background = pkgs.fetchurl {
    url = "https://gitlab.com/eadwu/backgrounds/raw/master/sen-no-kiseki-iv.jpg";
    sha256 = "1yfnj185xcs4xfilqsx38qjs6w6m5jl20m2p3jj1nfilqff4mgd4";
  };
in {
  imports =
    [
      ./enso-greeter.nix
      ./gtk-greeter.nix
    ];

  services = {
    xserver = {
      displayManager = {
        lightdm = {
          enable = true;
          background = "${background}";

          greeters = {
            enso = {
              enable = true;
            };

            gtk = {
              enable = false;
            };
          };
        };
      };
    };
  };
}
