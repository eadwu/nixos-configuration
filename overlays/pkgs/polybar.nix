self: super:

let
  inherit (self.pkgs) stdenv fetchFromGitHub;
in {
  polybar = (super.polybar.override {
    githubSupport = true;
    mpdSupport = true;
    pulseSupport = true;
  }).overrideAttrs (oldAttrs: rec {
    name = "${pname}-${version}";
    pname = stdenv.lib.removeSuffix "-${oldAttrs.version}" oldAttrs.name;
    version = "unstable-2019-02-18";

    src = fetchFromGitHub {
      owner = "jaagr";
      repo = "polybar";
      rev = "ea7399decc9b9d323c0ba70e2e9a31af33cbfe09";
      sha256 = "1x9fqhma6lmprj6l9sy9s5040dlz7npzwxnjc7k1pffzni2080sr";
      fetchSubmodules = true;
    };
  });
}
