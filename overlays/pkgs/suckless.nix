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
      rev = "72e31b1b1bbb97e1bda2e8a46cd53d70f1950ee5";
      sha256 = "003qra39n6i861kpbrjl1z8j56b1p7pp5y3incp4856jfp0w51cq";
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
