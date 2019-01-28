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
      rev = "a7ad68da31aa15a8b7fae51ad408c6ca17a3239a";
      sha256 = "1v9v4dcjfmg5mg4adhb2ljyzk8jgzv42w3rjlj76y9w215cbmm9a";
      fetchSubmodules = true;
    };
  });
}
