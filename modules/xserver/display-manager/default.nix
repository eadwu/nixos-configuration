{ config, pkgs, ... }:

let
  background = pkgs.fetchurl {
    url = "https://gitlab.com/eadwu/backgrounds/raw/master/70791127_p0.jpg";
    sha256 = "1zs0kcd88wssybl2w9ba671vrm9w1b5j0lyf5pwxw0wy0qri1iqx";
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
