{ pkgs, ... }:

let
  fadedMaterial = pkgs.fetchurl {
    url = "https://gitlab.com/ddwy/configs/raw/b2eaefbf274ccb940411e35e58c0917774d608d7/.vim/colors/faded_material.vim";
    sha256 = "1lqswa7mrzshwsjgizg9qiz4kbxjwq60gpzv8wvp98g4yaad063i";
  };

  walAirline = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/dylanaraps/wal.vim/1edf653c0f2848eac6d3c4d45fdc75bc4524c7b5/autoload/airline/themes/wal.vim";
    sha256 = "0livirsczgwsh0267fanp1axcx8swzha5wpdgi3ikaxps6pdvgn9";
  };
in {
  home.file = {
    ".vim/colors/faded_material.vim".source = fadedMaterial;
    ".vim/autoload/airline/themes/wal.vim".source = walAirline;
  };

  programs.vim = {
    enable = true;

    extraConfig = ''
      set expandtab
      set relativenumber
      set number
      set softtabstop=2
      set timeoutlen=1000
      set ttimeoutlen=0

      let g:airline_theme='wal'
      colorscheme faded_material
    '';

    plugins = [
      "vim-nix"
      "vim-airline"
    ];

    settings = {
      background = "dark";
      shiftwidth = 2;
      tabstop = 2;
    };
  };
}
