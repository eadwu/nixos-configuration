{ buildGoModule, fetchFromGitHub }:

buildGoModule 
rec {
  pname = "dnstap";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "dnstap";
    repo = "golang-dnstap";
    rev = "v${version}";
    sha256 = "sha256-GmwHJ6AQ4HcPEFNeodKqJe/mYE1Fa95hRiQWoka/nv4=";
  };

  vendorSha256 = "sha256-1MFd0+jp5LQ9Wyx7xI6kSAmtkWqsIqCn0zJrmJ4Rc88=";

  doCheck = false;
}