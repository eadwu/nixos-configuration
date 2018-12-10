self: super:

let
  inherit (self) pkgs;
  inherit (pkgs) epkgs fetchgit emacsPackagesNgGen;

  emacs27 = (super.emacs.override {
    srcRepo = true;
    withGTK2 = false;
    withGTK3 = true;
  }).overrideAttrs (oldAttrs: {
    src = fetchgit {
      url = "https://git.savannah.gnu.org/git/emacs.git";
      rev = "87bc518afcc3adc23762944ef49f89d375f90260";
      sha256 = "17v9gyz2gqfdfzf1awb8znhds3779mw5n301892sd5kw806cyv5g";
    };

    buildInputs = oldAttrs.buildInputs ++ (with pkgs; [
      acl
    ]);
  });
  emacsWithPackages = (emacsPackagesNgGen emacs27).emacsWithPackages;
in {
  emacs = emacsWithPackages (epkgs: (with epkgs.elpaPackages; [
    auctex
    # mmm-mode
  ]) ++ (with epkgs.melpaPackages; [
    beacon
    color-theme-sanityinc-tomorrow
    company
    company-auctex
    company-lsp
    company-web
    counsel
    # cquery # needs cquery executable
    diminish # needed for use-package?
    emmet-mode
    flycheck
    flycheck-inline
    hydra
    interleave
    ivy-rich
    js2-mode
    lsp-java
    lsp-javascript-typescript
    lsp-mode
    lsp-python
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
  ]) ++ (with epkgs.orgPackages; [
    org
  ]));
}
