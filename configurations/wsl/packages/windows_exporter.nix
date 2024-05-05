{ buildGoModule, fetchFromGitHub
, promu }:

buildGoModule 
rec {
  pname = "windows_exporter";
  version = "0.20.0";

  src = fetchFromGitHub {
    owner = "prometheus-community";
    repo = "windows_exporter";
    rev = "v${version}";
    sha256 = "sha256-dJ8LrCffAlrJCxLDmRuH28RdwlIWBqz9o+IOog749XE=";
  };

  vendorSha256 = "sha256-aeoCAGW7vY5eJSVGFHbp6AFgNXP9aqH5TafKhKmQ/a8=";

  /*
  # https://github.com/prometheus-community/windows_exporter/blob/v0.20.0/.promu.yml
  ldflags = [
    "-X github.com/prometheus/common/version.Version=${version}"
    "-X github.com/prometheus/common/version.Revision=v${version}"
    "-X github.com/prometheus/common/version.Branch=v${version}"
    "-X github.com/prometheus/common/version.BuildUser=nixbld"
  ];

  buildInputs = [ promu ];

  preBuild = ''
    ldflags+=" -X github.com/prometheus/common/version.BuildDate=$SOURCE_DATE_EPOCH"
  '';
  */

  buildPhase = ''
    runHook preBuild

    mkdir -p $out/bin
    ${promu}/bin/promu build --verbose --prefix $out/bin

    runHook postBuild
  '';

  dontInstall = true;
  dontStrip = true;
  dontFixup = true;
}