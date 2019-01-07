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
      rev = "202bd7bff2710b98cde4ae4b6e1f6de9818591f8";
      sha256 = "0lxnd9viwdd50kc5jiq92yjssbcxwmjkfpgdg9pgz86b5sp973zr";
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
