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
      rev = "dd521f820d418216fdf43e023e85a1f14d4f060a";
      sha256 = "03qn71w1fixz5vxv2byhimb44qa2pq2p2slrlwyzd679nn004r44";
    };

    node_modules_root = fetchNodeModules {
      inherit src;
      nodejs = pkgs.nodejs-10_x;
      sha256 = "1wpfkl58plklnm055pm4pr705mhm02y1xycf6v861ysv9q7w3xfs";
    };

    node_modules_src = fetchNodeModules {
      src = "${src}/src";
      nodejs = pkgs.nodejs-10_x;
      sha256 = "16xlgxkf1xghqns79fnagzqcbvsx6brpscv0hlv4l8d8pqk54d9d";
    };

    # "https://atom.io/download/electron/v${version}/iojs-v${version}.tar.gz"
    node_pty = buildNativeModule {
      name = "node-pty";
      nodejs = pkgs.nodejs-10_x;
      src = "${node_modules_src}/node-pty";
      nodeSHA256 = "02wja8cd17ac2rcm9fbvim9v1xbz987j7kjfsh1dm47djjsv8j9z";
      headerSHA256 = "17jrsn5y8qzh5bc6bjlkppm4lhh885c6p73nidsizhhq9x2n4ahq";
    };
  });
}
