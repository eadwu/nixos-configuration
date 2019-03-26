self: super:

{
  dmenu = super.dmenu.overrideAttrs (oldAttrs: rec {
    name = "${pname}-${version}";
    pname = "dmenu";
    version = "develop";

    src = builtins.fetchGit {
      url = "https://gitlab.com/eadwu/dmenu";
      ref = version;
    };
  });

  dwm = super.dwm.overrideAttrs (oldAttrs: rec {
    name = "${pname}-${version}";
    pname = "dwm";
    version = "develop";

    src = builtins.fetchGit {
      url = "https://gitlab.com/eadwu/dwm";
      ref = version;
    };
  });

  st = super.st.overrideAttrs (oldAttrs: rec {
    name = "${pname}-${version}";
    pname = "st";
    version = "develop";

    src = builtins.fetchGit {
      url = "https://gitlab.com/eadwu/st";
      ref = version;
    };
  });
}
