{ buildGoModule, fetchFromGitHub }:

buildGoModule 
rec {
  pname = "influx2cortex";
  version = "unstable-2022-10-19";

  src = fetchFromGitHub {
    owner = "grafana";
    repo = "influx2cortex";
    rev = "6ef88aa54ff30b95bda57fc1bdfbc7ecd88f7485";
    sha256 = "sha256-/HTtP/UE8RVst5DgWAaUbVLI3mIPQQZQOQAJD+AtkRg=";
  };

  vendorSha256 = "sha256-+gXnfSS+owphMSteK0XaBtil9ulkdKbr9gmp2Z0lDa4=";

  preBuild = ''
    # Extra baggage not needed for executable
    rm -rf .drone
  '';

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