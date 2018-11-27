self: super:

let
  inherit (self) pkgs;
  inherit (pkgs) fetchurl callPackage fetchFromGitHub;

  electron = super.electron.overrideAttrs (oldAttrs: rec {
    name = "electron-${version}";
    version = "3.0.10";

    src = fetchurl {
      url = "https://github.com/electron/electron/releases/download/v${version}/electron-v${version}-linux-x64.zip";
      sha256 = "01nk5q79k31lllsd678ff4d2pnm5s5fzf43d3q1syc6swd4dvsm6";
    };
  });

  fetchNodeModules = callPackage <nixpkgs/pkgs/applications/networking/instant-messengers/rambox/fetchNodeModules.nix> { };
  buildNativeModule = callPackage <nixpkgs/pkgs/applications/misc/edex-ui/buildNativeModule.nix> {
    inherit electron fetchNodeModules;
  };
in {
  edex-ui = (super.edex-ui.override {
    inherit electron;
  }).overrideAttrs (oldAttrs: rec {
    src = fetchFromGitHub {
      owner = "GitSquared";
      repo = "edex-ui";
      rev = "e0500213c30c1e05aee856787d1fce1982bd2169";
      sha256 = "1891dy0w5i7br8vjws9xwab3wmd1s3nbg85ch2qkpdcvrf8lsywr";
    };

    node_modules_root = fetchNodeModules {
      inherit src;
      nodejs = pkgs.nodejs-10_x;
      sha256 = "19m7147rbdncn5gq8p52rwiq5gjmlgdh0nlvzpzblllpk9bdasxf";
    };

    node_modules_src = fetchNodeModules {
      src = "${src}/src";
      nodejs = pkgs.nodejs-10_x;
      sha256 = "0ik648i06zz9sr00a6mmrrqxjs7yzjvbv9s3sfn7wqcbm2c22xp1";
    };

    # "https://atom.io/download/electron/v${version}/iojs-v${version}.tar.gz"
    node_pty = buildNativeModule {
      name = "node-pty";
      nodejs = pkgs.nodejs-10_x;
      src = "${node_modules_src}/node-pty";
      sha256 = "0q7cvcz41nqxya5iirrsq9vsk2knjhh3j40a5qgvx8mgxsqr2aq9";
      nodeSHA256 = "02wja8cd17ac2rcm9fbvim9v1xbz987j7kjfsh1dm47djjsv8j9z";
      headerSHA256 = "17jrsn5y8qzh5bc6bjlkppm4lhh885c6p73nidsizhhq9x2n4ahq";
    };
  });
}
