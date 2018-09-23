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

  lightdm-enso-os-greeter = super.lightdm-enso-os-greeter.overrideAttrs (oldAttrs: {
    src = fetchgit {
      url = "https://github.com/nick92/Enso-OS";
      rev = "91a064a4dcf469c1325be3806f016434e15da6e0";
      sha256 = "0y937zxsgdzja17hkr8gpz2yzjzydf90l0y0rsja29jawir8qqm6";
    };
  });

  ncmpcpp = super.ncmpcpp.override {
    clockSupport = true;
    outputsSupport = true;
    visualizerSupport = true;
  };
}
