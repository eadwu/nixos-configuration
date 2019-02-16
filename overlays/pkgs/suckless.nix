self: super:

{
  dmenu = super.dmenu.overrideAttrs (oldAttrs: rec {
    name = "${pname}-${version}";
    pname = "dmenu";
    version = "latest";

    src = builtins.fetchGit {
      url = "https://gitlab.com/eadwu/dmenu";
      ref = "develop";
    };
  });

  dwm = super.dwm.overrideAttrs (oldAttrs: rec {
    name = "${pname}-${version}";
    pname = "dwm";
    version = "latest";

    src = builtins.fetchGit {
      url = "https://gitlab.com/eadwu/dwm";
      ref = "develop";
    };
  });

  st = super.st.overrideAttrs (oldAttrs: rec {
    name = "${pname}-${version}";
    pname = "st";
    version = "latest";

    src = builtins.fetchGit {
      url = "https://gitlab.com/eadwu/st";
      ref = "develop";
    };
  });
}
