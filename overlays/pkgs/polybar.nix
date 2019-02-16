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
    version = "unstable-2019-02-08";

    src = fetchFromGitHub {
      owner = "jaagr";
      repo = "polybar";
      rev = "ca4426a9620f4db05a0117282fbed3a32a14ec92";
      sha256 = "0fg1h60b7ivrb9i5h44axmxj9ns4hzaq02f6s33v02n3yia019fv";
      fetchSubmodules = true;
    };
  });
}
