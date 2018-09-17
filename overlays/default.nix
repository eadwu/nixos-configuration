[
  (import ./pkgs/emacs.nix)
  (import ./pkgs/polybar.nix)
  (import ./pkgs/suckless.nix)
  (import ./pkgs/vscode.nix)

  (self: super: with self.pkgs; {
    ark = super.ark.override {
      unfreeEnableUnrar = true;
    };

    capitaine-cursors = super.capitaine-cursors.overrideAttrs (oldAttrs: {
      src = fetchgit {
        url = "https://github.com/keeferrourke/capitaine-cursors";
        rev = "3ae9acee30f482677caa345ec702141a1db696c2";
        sha256 = "1kck0lpzwvcb8bbsvzsvvfyaa7cs1h0p5xfbn798lx0c281lis5q";
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
  })
]
