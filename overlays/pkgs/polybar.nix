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
    version = "unstable-2019-03-13";

    src = fetchFromGitHub {
      owner = "jaagr";
      repo = "polybar";
      rev = "5995a8dacef62d7f15ef20ee5e0173eae6e9216f";
      sha256 = "06v3m540bxxdzvp8dh5faj0ig83c8jgspda3bmh960zjhw5jay13";
      fetchSubmodules = true;
    };
  });
}
