self: super:

let
  sddm-theme = { lib, stdenv, ... }@args:
    stdenv.mkDerivation (rec {
      dontBuild = true;

      installPrefix = "share/sddm/themes";
      themeName = lib.removePrefix "sddm-" args.pname;

      installPhase = ''
        runHook preInstall

        mkdir -p $out/$installPrefix
        cp -r . $out/$installPrefix/$themeName

        runHook postInstall
      '';
    } // (builtins.removeAttrs args [ "lib" "stdenv" ]));
in with self.pkgs; {
  sddm = (libsForQt511.callPackage <nixpkgs/pkgs/applications/display-managers/sddm> { }).overrideAttrs (oldAttrs: {
    nativeBuildInputs = (oldAttrs.nativeBuildInputs or []) ++ [ makeWrapper ];

    postInstall = (oldAttrs.postInstall or "") + ''
      wrapProgram $out/bin/sddm \
        --prefix QT_PLUGIN_PATH : ${qt511.full}/${qt511.qtbase.qtPluginPrefix} \
        --prefix QML_IMPORT_PATH : ${qt511.full}/${qt511.qtbase.qtQmlPrefix} \
        --prefix QML2_IMPORT_PATH : ${qt511.full}/${qt511.qtbase.qtQmlPrefix}
    '';
  });

  sddm-chili = libsForQt511.callPackage
    ({ lib, stdenv
      , qtbase, qtquickcontrols, qtgraphicaleffects }: sddm-theme (rec {
      inherit lib stdenv;
      pname = "sddm-chili";
      version = "0.1.5";

      src = fetchFromGitHub {
        owner = "MarianArlt";
        repo = "sddm-chili";
        rev = version;
        sha256 = "036fxsa7m8ymmp3p40z671z163y6fcsa9a641lrxdrw225ssq5f3";
      };

      buildInputs = [
        qtbase
        qtquickcontrols
        qtgraphicaleffects
      ];
    })) { };

  sddm-delicious = libsForQt511.callPackage
    ({ lib, stdenv
     , qtbase, qtmultimedia, qtquickcontrols, qtgraphicaleffects }: sddm-theme ({
      inherit lib stdenv;
      pname = "sddm-delicious";
      version = "unstable-2019-03-03";

      src = fetchFromGitHub {
        owner = "stuomas";
        repo = "delicious-sddm-theme";
        rev = "fc98a56db6a61521cb2c55f2c50416f01f565ef7";
        sha256 = "085n7663p0bz6jl516z7gvkc09m2rr33cygpl3n3fnyg3ins7msw";
      };

      buildInputs = [
        qtbase
        qtmultimedia
        qtquickcontrols
        qtgraphicaleffects
      ];

      postPatch = ''
        sed -i 's@"../background/" + \(config.background\)@\1@' src/logic.js
      '';
     })) { };

  sddm-sugar-dark = libsForQt511.callPackage
    ({ lib, stdenv
     , qtsvg, qtbase, qtquickcontrols2 }: sddm-theme ({
      inherit lib stdenv;
      pname = "sddm-sugar-dark";
      version = "unstable-2019-03-06";

      src = fetchFromGitHub {
        owner = "MarianArlt";
        repo = "sddm-sugar-dark";
        rev = "2c1a229cfbac3167dd3619afa93f75f8c14f884a";
        sha256 = "1sx03ffqd84zkx3iky0ni5rs5ild0zrj440ml0pjfsjx07in5v82";
      };

      buildInputs = [
        qtsvg
        qtbase
        qtquickcontrols2
      ];
     })) { };
}
