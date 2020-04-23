self: super:

with self.pkgs; {
  sddm = libsForQt5.callPackage
    (
      { callPackage, qtbase }:
        (callPackage (self.pkgs.path + "/pkgs/applications/display-managers/sddm") {}).overrideAttrs (
          oldAttrs: {
            buildInputs = (oldAttrs.buildInputs or []) ++ (
              with gst_all_1; [
                gstreamer
                gst-libav
                gst-plugins-base
                gst-plugins-good
                gst-plugins-ugly
                gst-plugins-bad
              ]
            );

            nativeBuildInputs = (oldAttrs.nativeBuildInputs or []) ++ [ wrapGAppsHook ];

            preFixup = (oldAttrs.preFixup or "") + ''
              gappsWrapperArgs+=(
                --prefix GST_PLUGIN_SYSTEM_PATH : "$GST_PLUGIN_SYSTEM_PATH"
                --prefix QT_PLUGIN_PATH : /run/current-system/sw/${qtbase.qtPluginPrefix}
                --prefix QML_IMPORT_PATH : /run/current-system/sw/${qtbase.qtQmlPrefix}
                --prefix QML2_IMPORT_PATH : /run/current-system/sw/${qtbase.qtQmlPrefix}
              )
            '';
          }
        )
    ) {};

  sddm-sugar-dark = libsForQt5.callPackage
    (
      { lib
      , stdenv
      , qtsvg
      , qtbase
      , qtquickcontrols2
      , qtmultimedia
      }: stdenv.mkDerivation rec {
        pname = "sddm-sugar-dark";
        version = "unstable-2019-06-15";

        src = fetchFromGitHub {
          owner = "MarianArlt";
          repo = "sddm-sugar-dark";
          rev = "0ed993a791ba6e486abeb5b88e6e8b2fd36ebdce";
          sha256 = "0sh4rrpbg0hv62rgsr7f0rf55p90i35084cjx8h9sklc4indnpa6";
        };

        dontBuild = true;

        installPrefix = "share/sddm/themes";
        themeName = lib.removePrefix "sddm-" pname;

        patches = [
          ../../patches/sddm/extend-mediatypes.patch
        ];

        propagatedUserEnvPkgs = [
          qtsvg.bin
          qtbase.bin
          qtquickcontrols2.bin

          # Dependencies for patch
          qtmultimedia.bin
        ];

        installPhase = ''
          runHook preInstall

          mkdir -p $out/$installPrefix
          cp -r . $out/$installPrefix/$themeName

          runHook postInstall
        '';
      }
    ) {};
}
