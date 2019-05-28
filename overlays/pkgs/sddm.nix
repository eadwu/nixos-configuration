self: super:

with self.pkgs; {
  sddm = libsForQt511.callPackage
    ({ callPackage, qtbase }:
    (callPackage <nixpkgs/pkgs/applications/display-managers/sddm> { }).overrideAttrs (oldAttrs: {
      buildInputs = (oldAttrs.buildInputs or []) ++ (with gst_all_1; [
        gstreamer gst-libav
        gst-plugins-base gst-plugins-good gst-plugins-ugly gst-plugins-bad
      ]);

      nativeBuildInputs = (oldAttrs.nativeBuildInputs or []) ++ [ wrapGAppsHook ];

      preFixup = (oldAttrs.preFixup or "") + ''
        gappsWrapperArgs+=(
          --prefix GST_PLUGIN_SYSTEM_PATH : "$GST_PLUGIN_SYSTEM_PATH"
          --prefix QT_PLUGIN_PATH : /run/current-system/sw/${qtbase.qtPluginPrefix}
          --prefix QML_IMPORT_PATH : /run/current-system/sw/${qtbase.qtQmlPrefix}
          --prefix QML2_IMPORT_PATH : /run/current-system/sw/${qtbase.qtQmlPrefix}
        )
      '';
    })) { };

  sddm-sugar-dark = libsForQt511.callPackage
    ({ lib, stdenv
     , qtsvg, qtbase, qtmultimedia, qtquickcontrols2, qtquickcontrols, qtgraphicaleffects }: stdenv.mkDerivation rec {
      pname = "sddm-sugar-dark";
      version = "unstable-2019-03-06";

      src = fetchFromGitHub {
        owner = "MarianArlt";
        repo = "sddm-sugar-dark";
        rev = "2c1a229cfbac3167dd3619afa93f75f8c14f884a";
        sha256 = "1sx03ffqd84zkx3iky0ni5rs5ild0zrj440ml0pjfsjx07in5v82";
      };

      dontBuild = true;

      installPrefix = "share/sddm/themes";
      themeName = lib.removePrefix "sddm-" pname;

      patches = [
        ../../patches/sddm/extend-mediatypes.patch
      ];

      buildInputs = [
        qtsvg
        qtbase
        qtquickcontrols2

        # Dependencies for patch
        qtmultimedia
      ];

      installPhase = ''
        runHook preInstall

        mkdir -p $out/$installPrefix
        cp -r . $out/$installPrefix/$themeName

        runHook postInstall
      '';
     }) { };
}
