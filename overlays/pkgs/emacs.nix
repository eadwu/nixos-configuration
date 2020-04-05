self: super:

let
  inherit (self) pkgs;
  inherit (pkgs) epkgs stdenv fetchurl emacsPackagesNgGen;

  emacs27 = (
    super.emacs.override {
      srcRepo = true;
      withGTK2 = false;
      withGTK3 = true;
    }
  ).overrideAttrs (
    oldAttrs: rec {
      name = "${pname}-${version}";
      pname = stdenv.lib.removeSuffix "-${oldAttrs.version}" oldAttrs.name;
      version = "27.0.90";

      src = fetchurl {
        url = "https://git.savannah.gnu.org/cgit/emacs.git/snapshot/${name}.tar.gz";
        sha256 = "sha256-Rynqv8zfGA/9n/OZXb2ww5Xa0uRb+OQy+ChThvjVv4I=";
      };

      patches =
        (builtins.filter
          (patch: (builtins.baseNameOf patch) != "clean-env.patch")
          oldAttrs.patches)
        ++ [
          ../../patches/emacs/clean-env.patch
        ];

      buildInputs = oldAttrs.buildInputs ++ (with pkgs; [ harfbuzz ]);
    }
  );
  emacsWithPackages = (emacsPackagesNgGen emacs27).emacsWithPackages;
in
{
  emacs = emacsWithPackages (
    epkgs: (
      with epkgs.elpaPackages; [
        auctex
        # mmm-mode
      ]
    ) ++ (
      with epkgs.melpaPackages; [
        beacon
        company
        company-auctex
        company-lsp
        company-web
        counsel
        # cquery # needs cquery executable
        doom-themes
        diminish # needed for use-package?
        ein
        elpy
        emmet-mode
        flycheck
        flycheck-inline
        hydra
        interleave
        ivy-rich
        js2-mode
        lsp-java
        lsp-mode
        lsp-ui
        magit
        nix-buffer
        nix-mode
        pandoc-mode
        projectile
        spaceline
        tide
        use-package
        wakatime-mode
      ]
    ) ++ (
      with epkgs.orgPackages; [
        org
      ]
    )
  );
}
