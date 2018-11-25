self: super:

let
  inherit (self) pkgs;
  inherit (pkgs) fetchurl callPackage fetchFromGitHub;

  fetchNodeModules = callPackage <nixpkgs/pkgs/applications/networking/instant-messengers/rambox/fetchNodeModules.nix> { };
  buildNativeModule = callPackage <nixpkgs/pkgs/applications/misc/edex-ui/buildNativeModule.nix> {
    inherit fetchNodeModules;
  };

  targetElectronVersion = "2.0.13";
  edex-ui-bare = callPackage <nixpkgs/pkgs/applications/misc/edex-ui/bare.nix> {
    inherit fetchNodeModules buildNativeModule;
  };
in rec {
  edex-ui = super.edex-ui.override {
    edex-ui-bare = edex-ui-bare.overrideAttrs (oldAttrs: rec {
      src = fetchFromGitHub {
        owner = "GitSquared";
        repo = "edex-ui";
        rev = "2dace0bc1f15fc92a07aa744a895f24c88b71225";
        sha256 = "0vkj8x00x1nbh9zi1vi467phnsiiv9fmn1ghdxqdd51d61pkrzw6";
      };

      node_modules_root = fetchNodeModules {
        inherit src;
        nodejs = pkgs.nodejs-8_x;
        sha256 = "1fbj0zl6jml1pwp2cyr23p8yhfwfxm74xlx4xg1748j530md0p6w";
      };

      node_modules_src = fetchNodeModules {
        src = "${src}/src";
        nodejs = pkgs.nodejs-8_x;
        sha256 = "07m4ykb4bpkx4z4fgrhpqh0gva6xlix0gbhdcrnvdk0lr023sqdj";
      };

      node_pty = buildNativeModule {
        name = "node-pty";
        nodejs = pkgs.nodejs-8_x;
        headerVersion = targetElectronVersion;
        src = "${node_modules_src}/node-pty";
        sha256 = "100hpblcqgrk7hgvdlfg10rly9d357yfld1abizix0qi3db7zqw7";
        nodeSHA256 = "02wja8cd17ac2rcm9fbvim9v1xbz987j7kjfsh1dm47djjsv8j9z";
        headerSHA256 = "0qmqi9sq0zpqdqz63vjc3aw190fih4dhq7qsfkd3f8f9jww450yz";
      };
    });

    electron = super.electron.overrideAttrs (oldAttrs: rec {
      name = "electron-${version}";
      version = targetElectronVersion;

      src = fetchurl {
        url = "https://github.com/electron/electron/releases/download/v${version}/electron-v${version}-linux-x64.zip";
        sha256 = "09s7gyfdnw17yzykqinhz6p2x92pqqbr9ls20rqq8axns9g12pmi";
      };
    });
  };
}
