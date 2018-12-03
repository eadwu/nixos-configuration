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
      rev = "e5634aae531ce932ecb8d84243d690c7ca89bec3";
      sha256 = "081wzdqbn2rk7k9y0hgmiimpsa482mm8ni0d6hirqijis0cdcdrw";
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
