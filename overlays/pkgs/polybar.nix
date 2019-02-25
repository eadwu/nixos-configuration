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
    version = "unstable-2019-02-24";

    src = fetchFromGitHub {
      owner = "jaagr";
      repo = "polybar";
      rev = "db9a83a83be9ed8c293ddb20ae48c98022e83aca";
      sha256 = "0qr9s9dg9fhgjz3sim6jjhlvas10fnxrlx1vxylhx4zbw2w9mhd2";
      fetchSubmodules = true;
    };
  });
}
