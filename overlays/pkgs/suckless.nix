self: super:

{
  dmenu = super.dmenu.overrideAttrs (oldAttrs: {
    src = builtins.fetchGit {
      url = "https://gitlab.com/eadwu/dmenu";
      ref = "develop";
    };
  });

  dwm = super.dwm.overrideAttrs (oldAttrs: {
    src = builtins.fetchGit {
      url = "https://gitlab.com/eadwu/dwm";
      ref = "develop";
    };
  });

  st = super.st.overrideAttrs (oldAttrs: {
    src = builtins.fetchGit {
      url = "https://gitlab.com/eadwu/st";
      ref = "develop";
    };
  });
}
