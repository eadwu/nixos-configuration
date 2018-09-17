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
      rev = "fe87b6e6dd4eb59c8553c499191519b53134e427";
      sha256 = "04njisajh86593m2mfgy6ygsmvgr500kdwrmcaxlpd2mb08k2gh0";
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
