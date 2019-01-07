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
      rev = "7256366112d3ec2163195131569b6e1b2a6c1418";
      sha256 = "1lnw4bbrfzcwv1gwy0qdy4lh55fcr32731m56j4mga33acvbrg8l";
      fetchSubmodules = true;
    };
  });
}
