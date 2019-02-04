self: super:

let
  inherit (self.pkgs) fetchFromGitLab;
in {
  dmenu = super.dmenu.overrideAttrs (oldAttrs: {
    src = fetchFromGitLab {
      owner = "eadwu";
      repo = "dmenu";
      rev = "f8257adfaa69701f06b0e11abaf70ab5f1222056";
      sha256 = "07k4nn5vahlg2fwpaamw69nmx46y7x8vzvgrppd8bi0gg9n0v4ln";
    };
  });

  dwm = super.dwm.overrideAttrs (oldAttrs: {
    src = fetchFromGitLab {
      owner = "eadwu";
      repo = "dwm";
      rev = "5788ba407883928736af330b9695ad0d3c39f898";
      sha256 = "1wfr3m4lwrmyfrqqklrmf4rn8gbqg70kgqf5750xzqjwchclxbv2";
    };
  });

  st = super.st.overrideAttrs (oldAttrs: {
    src = fetchFromGitLab {
      owner = "eadwu";
      repo = "st";
      rev = "7ec6cfc57e91a4a216af146bacb0f88fb2e5cc76";
      sha256 = "1ixcin15l67qhdyf8vjngv55fj5si6jnc9nw0kk4sg876y04r6s9";
    };
  });
}
