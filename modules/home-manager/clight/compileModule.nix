{ name, src }:
{ stdenv, clight, libmodule }:

stdenv.mkDerivation {
  name = "clight-module-${name}";

  inherit src;

  dontUnpack = true;

  buildInputs = [ clight libmodule ];

  buildPhase = ''
    gcc -shared -fPIC $src -o ${name} -Wno-unused
  '';

  installPhase = ''
    mkdir -p $out/share/clight/modules.d
    cp ${name} $out/share/clight/modules.d/${name}
  '';
}
