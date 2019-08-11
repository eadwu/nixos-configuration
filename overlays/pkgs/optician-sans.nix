self: super:

with self.pkgs; {
  optician-sans = stdenv.mkDerivation rec {
    pname = "optician-sans";
    version = "master";

    src = builtins.fetchTarball {
      url = "https://github.com/anewtypeofinterference/Optician-Sans/archive/${version}.tar.gz";
    };

    dontBuild = true;

    installPhase = ''
      mkdir -p $out/share/fonts/opentype
      find $src -name '*.otf' -exec cp "{}" $out/share/fonts/opentype \;
    '';
  };
}
