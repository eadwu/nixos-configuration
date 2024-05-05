{ buildGoModule, fetchFromGitHub }:

buildGoModule 
rec {
  pname = "mimir-proxies";
  version = "unstable-2022-09-29";

  src = fetchFromGitHub {
    owner = "grafana";
    repo = "mimir-proxies";
    rev = "ecfe835fa036ab8a98b52c17fd60caa7d3d4636f";
    sha256 = "sha256-6BF/2eZqC+mtmh5JoKTXSqDenSN+uHqGwbkGeyIS4W8=";
  };

  vendorSha256 = "sha256-R0N602u1eLhkUxb324Qc8h9muwBYan1nhYa+u3Gvbp0=";
  
  /*
  buildPhase = ''
    runHook preBuild

    make build

    runHook postBuild
  '';

  # doCheck = false;
  checkPhase = ''
    runHook preCheck

    make test

    runHook postCheck
  '';
  */
}