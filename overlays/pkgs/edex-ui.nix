self: super:

let
  inherit (self) pkgs;
  inherit (pkgs) fetchurl callPackage fetchFromGitHub;

  targetElectronVersion = "3.0.10";
  electron = if (super.electron.version == targetElectronVersion)
    then super.electron
    else super.electron.overrideAttrs (oldAttrs: rec {
      name = "electron-${version}";
      version = targetElectronVersion;

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
      rev = "f7d6970bfef47123b31851ed9aad1f980eec99e6";
      sha256 = "031dhb0xpnw023dj082h873hk5ca26gliff6vfaqp9ihz72gp767";
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

    # "https://atom.io/download/electron/v${version}/iojs-v${version}.tar.gz"
    node_pty = buildNativeModule {
      name = "node-pty";
      nodejs = pkgs.nodejs-8_x;
      src = "${node_modules_src}/node-pty";
      sha256 = "06rbvyyviy25hbma0xby48b496izj31k90cpbsn6x5yq8yc9dch2";
      nodeSHA256 = "02wja8cd17ac2rcm9fbvim9v1xbz987j7kjfsh1dm47djjsv8j9z";
      headerSHA256 = "17jrsn5y8qzh5bc6bjlkppm4lhh885c6p73nidsizhhq9x2n4ahq";
    };
  });
}
