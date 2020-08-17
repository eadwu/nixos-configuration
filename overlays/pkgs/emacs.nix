final: prev:

let
  inherit (final) pkgs;
  inherit (pkgs) epkgs stdenv fetchurl emacsPackagesNgGen;

  emacs27 = (
    prev.emacs.override {
      srcRepo = true;
      withGTK2 = false;
      withGTK3 = true;
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
