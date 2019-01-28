self: super: let
  rPackages = with super.rPackages; [
    ggplot2
    showtext
    rmarkdown
    RDocumentation
  ];
in with self.pkgs; {
  inherit (import ./pkgs/blender.nix self super) blender;
  inherit (import ./pkgs/emacs.nix self super) emacs;
  inherit (import ./pkgs/polybar.nix self super) polybar;
  inherit (import ./pkgs/suckless.nix self super) dmenu dwm st;
  inherit (import ./pkgs/vscode.nix self super) vscode;

  ark = super.ark.override {
    unfreeEnableUnrar = true;
  };

  capitaine-cursors = super.capitaine-cursors.overrideAttrs (oldAttrs: {
    src = fetchFromGitHub {
      owner = "keeferrourke";
      repo = "capitaine-cursors";
      rev = "960f9e9011bab281bbcb1355fc45d43295282034";
      sha256 = "1szxwwj1x87wlvj18jdjxh4dl88hkkq9fp3sl58wcp9jw6iaixrv";
    };
  });

  glava = super.glava.override {
    enableGlfw = true;
  };

  lightdm-enso-os-greeter = super.lightdm-enso-os-greeter.overrideAttrs (oldAttrs: {
    src = fetchFromGitHub {
      owner = "nick92";
      repo = "Enso-OS";
      rev = "14bf28e59ede7c57467e21a39c82792dbf531f9c";
      sha256 = "1y4sbqhv2zhxfxbri1hal26ba7afj4i7ci0w18p5dk7k8xqq77kc";
    };
  });

  ncmpcpp = super.ncmpcpp.override {
    clockSupport = true;
    outputsSupport = true;
    visualizerSupport = true;
  };

  optician-sans = callPackage ./pkgs/optician-sans.nix { };

  rWrapper = super.rWrapper.override {
    packages = rPackages;
  };

  rstudioWrapper = super.rstudioWrapper.override {
    packages = rPackages;
  };
}
