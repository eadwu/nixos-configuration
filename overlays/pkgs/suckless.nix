self: super:

let
  inherit (super) fetchgit;
in {
  dmenu = super.dmenu.overrideAttrs (oldAttrs: {
    src = fetchgit {
      url = "https://gitlab.com/eadwu/dmenu";
      rev = "eae2a506dab7168d030fb43a2fcb6c79fd601d8f";
      sha256 = "0a143vw1nap80xzbasqy0r82ky4v6ah1ffn4mfmjxwg3m82j00np";
    };
  });

  dwm = super.dwm.overrideAttrs (oldAttrs: {
    src = fetchgit {
      url = "https://gitlab.com/eadwu/dwm";
      rev = "f5a086fa9c2a27f88e8dfd1ca90fd2980328e827";
      sha256 = "0sn2xg67ps3a9p7jzi49isnglknpbzjhqdv6sn09gm501srnfm0v";
    };
  });

  st = super.st.overrideAttrs (oldAttrs: {
    src = fetchgit {
      url = "https://gitlab.com/eadwu/st";
      rev = "f43aa9382c0cc7a46a6a8d6e4b0c030ad8dce8e1";
      sha256 = "1bmsvqb4l4ayzandgb9awfr9d9minrgy0wvy6w7jkp7izij0q9jp";
    };
  });
}
