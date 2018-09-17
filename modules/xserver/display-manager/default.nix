{ config, pkgs, ... }:

let
  backgrounds = pkgs.fetchgit {
    url = "https://gitlab.com/eadwu/backgrounds";
    rev = "c6ba272d72b161b2f7fca1a85398de724b7725b2";
    sha256 = "1s8j7fpyxps5gprqxk6zf7cjhv2gkaxpndgdbkcxp8r7i908y362";
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
          background = "${backgrounds}/963246ae-c25d-4a69-bfa8-29b51f08eebb.png";

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
