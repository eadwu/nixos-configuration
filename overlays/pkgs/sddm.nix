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
      mkdir -p $out/share/sddm/themes
      cp -r . $out/share/sddm/themes/chili
    '';
  };

  sddm-sugar-dark = stdenv.mkDerivation rec {
    pname = "sddm-sugar-dark";
    version = "unstable-2019-03-06";

    src = fetchFromGitHub {
      owner = "MarianArlt";
      repo = "sddm-sugar-dark";
      rev = "2c1a229cfbac3167dd3619afa93f75f8c14f884a";
      sha256 = "1sx03ffqd84zkx3iky0ni5rs5ild0zrj440ml0pjfsjx07in5v82";
    };

    dontBuild = true;

    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -r . $out/share/sddm/themes/sugar-dark
    '';
  };

  sddm-delicious = stdenv.mkDerivation rec {
    pname = "sddm-delicious";
    version = "unstable-2019-03-03";

    src = fetchFromGitHub {
      owner = "stuomas";
      repo = "delicious-sddm-theme";
      rev = "fc98a56db6a61521cb2c55f2c50416f01f565ef7";
      sha256 = "085n7663p0bz6jl516z7gvkc09m2rr33cygpl3n3fnyg3ins7msw";
    };

    postPatch = ''
      sed -i 's@"../background/" + \(config.background\)@\1@' src/logic.js
    '';

    dontBuild = true;

    installPhase = ''
      mkdir -p mkdir -p $out/share/sddm/themes
      cp -r . $out/share/sddm/themes/delicious
    '';
  };
}
