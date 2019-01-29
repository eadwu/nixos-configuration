{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "optician-sans";
  version = "20181218";

  src = fetchFromGitHub {
    owner = "anewtypeofinterference";
    repo = "Optician-Sans";
    rev = "8e4842dd95ea1fb6397d39f7538d4a77e29a9bbf";
    sha256 = "190dp1ahxffi7xfql4xpyma9rwr63qnp9y0b5y5gyg1fhw9hzh3p";
  };

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share/fonts/opentype
    find $src -name '*.otf' -exec cp "{}" $out/share/fonts/opentype \;
  '';
}
