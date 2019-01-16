self: super:

let
  inherit (self.pkgs) fetchFromGitLab;
in {
  dmenu = super.dmenu.overrideAttrs (oldAttrs: {
    src = fetchFromGitLab {
      owner = "eadwu";
      repo = "dmenu";
      rev = "eae2a506dab7168d030fb43a2fcb6c79fd601d8f";
      sha256 = "0a143vw1nap80xzbasqy0r82ky4v6ah1ffn4mfmjxwg3m82j00np";
    };
  });

  dwm = super.dwm.overrideAttrs (oldAttrs: {
    src = fetchFromGitLab {
      owner = "eadwu";
      repo = "dwm";
      rev = "8eaac8bf786d581be80b2ab842edb46aefc44e19";
      sha256 = "0xgga9x8b8bl754fyyjs856x6qxs8hmkhxc4ikn4g35khxms454w";
    };
  });

  st = super.st.overrideAttrs (oldAttrs: {
    src = fetchFromGitLab {
      owner = "eadwu";
      repo = "st";
      rev = "d73f211031726a5063ac53b9457f12b2473cc07b";
      sha256 = "1ajv0gdva9ipga4zhpw92pwcw3hvn7iz3lhc57na0zihai3xdbm1";
    };
  });
}
