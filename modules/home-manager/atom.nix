{ pkgs, ... }:

let
  init = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/atom/atom/ef129f9491e303621f16c7806d716ad54ccd495b/dot-atom/init.coffee";
    sha256 = "15y0jgizyvd410p68cf8g56nmjmwna6i7szz6d9w9d2pyl57hvim";
  };

  keymap = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/atom/atom/1aa013ca7a4418498cfcb15b644d2142a0247a0c/dot-atom/keymap.cson";
    sha256 = "0gaq9042ssrsq06v1fnlgn8zbbqprynn4i4nv857pmwcsnwd8did";
  };

  snippets = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/atom/atom/6fc3a364e1c43921fe0987e4e91ca254b364d33e/dot-atom/snippets.cson";
    sha256 = "1r7jmgilqn54yg4p4mjnlngzi485qqj9k6cf52ayn0d8hrp1a2rk";
  };
in {
  home.file = {
    ".atom/config.cson".source = ./atom/config.cson;
    ".atom/init.coffee".source = init;
    ".atom/keymap.cson".source = keymap;
    ".atom/snippets.cson".source = snippets;
    ".atom/styles.less".source = ./atom/styles.less;
  };
}
