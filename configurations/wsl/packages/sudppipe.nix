{ stdenv, fetchzip }:

stdenv.mkDerivation 
{
  pname = "sudppipe";
  version = "0.4.1";

  src = fetchzip {
    # Dead
    # url = "https://aluigi.altervista.org/mytoolz/sudppipe.zip";
    url = "https://web.archive.org/web/20230111013519/https://aluigi.altervista.org/mytoolz/sudppipe.zip";
    sha256 = "sha256-1Md1DOafJRVsvmLeqCNPCAsknJtSI3eC5fel5VlKy8M=";
    stripRoot = false;
  };

  buildPhase = ''
    runHook preBuild

    mkdir -p build/
    ${stdenv.cc}/bin/*gcc -o build/sudppipe.exe *.c -lwsock32 -lws2_32

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp build/sudppipe.exe $out/bin
    chmod +x $out/bin/sudppipe.exe

    runHook postInstall
  '';
}
