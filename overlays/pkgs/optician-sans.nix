self: super:

with self.pkgs; {
  optician-sans = stdenv.mkDerivation {
    pname = "optician-sans";
    version = "latest";

    src = builtins.fetchGit {
      url = "https://github.com/anewtypeofinterference/Optician-Sans";
    };

    dontBuild = true;

    installPhase = ''
      mkdir -p $out/share/fonts/opentype
      find $src -name '*.otf' -exec cp "{}" $out/share/fonts/opentype \;
    '';
  };
}
