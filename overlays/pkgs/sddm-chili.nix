self: super:

with self.pkgs; {
  sddm-chili = stdenv.mkDerivation rec {
    pname = "sddm-chili";
    version = "0.1.5";

    src = fetchFromGitHub {
      owner = "MarianArlt";
      repo = "sddm-chili";
      rev = version;
      sha256 = "036fxsa7m8ymmp3p40z671z163y6fcsa9a641lrxdrw225ssq5f3";
    };

    dontBuild = true;

    installPhase = ''
      mkdir -p mkdir -p $out/share/sddm/themes
      cp -r $src $out/share/sddm/themes/chili
    '';
  };
}
