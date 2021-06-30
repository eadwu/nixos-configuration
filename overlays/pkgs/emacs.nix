final: prev:

with final.pkgs;

{
  _aliases = (prev._aliases or { }) // {
    emacs = (emacsPackagesFor emacsUnstable).emacsWithPackages
      (
        epkgs: (
          with epkgs.elpaPackages; [
            auctex
          ]
        ) ++ (
          with epkgs.melpaPackages; [
            ccls
            flycheck-inline
            wakatime-mode
          ]
        ) ++ (
          with epkgs.melpaStablePackages; [
            avy
            beacon
            company
            company-web
            counsel
            # cquery # cquery has been removed because it is abandoned by upstream. Consider switching to clangd or ccls instead.
            doom-themes
            diminish # needed for use-package?
            ein
            elpy
            emmet-mode
            flycheck
            hydra
            ivy-rich
            js2-mode
            lsp-java
            lsp-mode
            lsp-ui
            magit
            mmm-mode
            nix-buffer
            nix-mode
            pandoc-mode
            projectile
            spaceline
            tide
            use-package
          ]
        ) ++ (
          with epkgs.orgPackages; [
            org-plus-contrib
          ]
        )
      );
  };
}
