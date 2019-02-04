self: super:

let
  inherit (self.pkgs) fetchFromGitHub;
in {
  polybar = (super.polybar.override {
    githubSupport = true;
    mpdSupport = true;
    pulseSupport = true;
  }).overrideAttrs (oldAttrs: {
    src = fetchFromGitHub {
      owner = "jaagr";
      repo = "polybar";
      rev = "f148f16da79f8da88e1fd47c7dd2afd69d82aa0e";
      sha256 = "0gnlzs419dkkx8pdn288490v745m7cm0xz3ldh0m8q7frk8r6d54";
      fetchSubmodules = true;
    };
  });
}
