{ buildGoModule, fetchFromGitHub }:

buildGoModule 
rec {
  pname = "promu";
  version = "0.14.0";

  src = fetchFromGitHub {
    owner = "prometheus";
    repo = "promu";
    rev = "v${version}";
    sha256 = "sha256-vxIO8xdkH0GY6Or2UwUWy2Eah52eVKWfRkL87imwi3o=";
  };

  vendorSha256 = "sha256-84ZhBcmLnVzqZ1MSKcOrafvWek334lriMQ0UNSEbUyw=";

  doCheck = false;
}