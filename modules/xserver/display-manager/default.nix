{ pkgs, ... }:

{
  imports =
    [
      ./enso-greeter.nix
      ./gtk-greeter.nix
    ];

  services.xserver.displayManager.lightdm = {
    enable = true;
    background = "${pkgs.fetchurl {
      url = "https://gitlab.com/eadwu/backgrounds/raw/master/issiki-iroha-oregairu.png";
      sha256 = "19hdsxa2373hcs09ikv0zj3w8zw2f8qsj9irpxkc4bkqd2qsqc7x";
    }}";

    greeters = {
      enso.enable = true;
      gtk.enable = false;
    };
  };
}
