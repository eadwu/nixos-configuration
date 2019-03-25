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
    version = "unstable-2019-03-22";

    src = fetchFromGitHub {
      owner = "jaagr";
      repo = "polybar";
      rev = "31a25af3d3465af719b82e92ccf19e19010a2a05";
      sha256 = "0xmdinwysn1dj8ypvgbpprgz5kfv3zzfwjj67w58kl4ja3zcbhl4";
      fetchSubmodules = true;
    };
  });
}
