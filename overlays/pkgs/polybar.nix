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
      rev = "c3ef99b719307ca21683174dd361ef1c7367a038";
      sha256 = "18hrsbq62na2i4rlwbs2ih7v9shnayg76nw14i6az28wpf8kx4rr";
      fetchSubmodules = true;
    };
  });
}
