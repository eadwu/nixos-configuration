self: super:

let
  inherit (self) pkgs;
  inherit (pkgs) fetchurl callPackage fetchFromGitHub;

  electron = super.electron.overrideAttrs (oldAttrs: rec {
    name = "electron-${version}";
    version = "4.0.0";

    src = fetchurl {
      url = "https://github.com/electron/electron/releases/download/v${version}/electron-v${version}-linux-x64.zip";
      sha256 = "1kh2jds7jra9f1vcn2z1193cxcyvfxkldim4b9ij7chj9xzxwgln";
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
      rev = "f1eaca47424e5e88e7bc288c8557d55b6367601c";
      sha256 = "1c3va2v892aajs16sgs69mq29pqhhsy484xgc16ms0hvry9wji7w";
    };

    node_modules_root = fetchNodeModules {
      inherit src;
      nodejs = pkgs.nodejs-10_x;
      sha256 = "1d6i06g9x67sl54hb3wkf96mk5nhifyr5x51m33p34lzpd7y67j2";
    };

    node_modules_src = fetchNodeModules {
      src = "${src}/src";
      nodejs = pkgs.nodejs-10_x;
      sha256 = "1ijbsllwffsz3xymn1lh5p6pxzv1sqmiz5mdyvkl92k2pcz16dph";
    };

    # "https://atom.io/download/electron/v${version}/iojs-v${version}.tar.gz"
    node_pty = buildNativeModule {
      name = "node-pty";
      nodejs = pkgs.nodejs-10_x;
      src = "${node_modules_src}/node-pty";
      nodeSHA256 = "02wja8cd17ac2rcm9fbvim9v1xbz987j7kjfsh1dm47djjsv8j9z";
      headerSHA256 = "1ih0sj84y4bn9nri9641w7bgjlyx7fj4rdyiklgddjv7mv01kln5";
    };
  });
}
