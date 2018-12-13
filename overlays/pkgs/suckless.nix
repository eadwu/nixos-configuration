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
      rev = "53490bfaa4eccfab1d7101c86f334e4bd1845a5b";
      sha256 = "10zc98qp38j708ldjd5j2m13gph4aj5q33apcnc5rx2kdc2qpaq9";
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
