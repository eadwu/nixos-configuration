self: super: with self.pkgs; {
  inherit (import ./pkgs/emacs.nix self super) emacs;
  inherit (import ./pkgs/polybar.nix self super) polybar;
  inherit (import ./pkgs/suckless.nix self super) dmenu dwm st;
  inherit (import ./pkgs/vscode.nix self super) vscode;

  ark = super.ark.override {
    unfreeEnableUnrar = true;
  };

  capitaine-cursors = super.capitaine-cursors.overrideAttrs (oldAttrs: {
    src = fetchgit {
      url = "https://github.com/keeferrourke/capitaine-cursors";
      rev = "960f9e9011bab281bbcb1355fc45d43295282034";
      sha256 = "1szxwwj1x87wlvj18jdjxh4dl88hkkq9fp3sl58wcp9jw6iaixrv";
    };
  });

  glava = super.glava.override {
    enableGlfw = true;
  };

  lightdm-enso-os-greeter = (super.lightdm-enso-os-greeter or {}).overrideAttrs (oldAttrs: {
    src = fetchgit {
      url = "https://github.com/nick92/Enso-OS";
      rev = "2d4184080c644b92b23f7a98e87b81b70b862bca";
      sha256 = "0157586alivhjjhb6xainkjhw4spps3bqwi4v3cmpmcm1nq5h8f2";
    };
  });

  ncmpcpp = super.ncmpcpp.override {
    clockSupport = true;
    outputsSupport = true;
    visualizerSupport = true;
  };
}
