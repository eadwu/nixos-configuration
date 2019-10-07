self: super:

let
  inherit (self) pkgs;
  inherit (pkgs) epkgs stdenv emacsPackagesNgGen;

  emacs27 = (
    super.emacs.override {
      srcRepo = true;
      withGTK2 = false;
      withGTK3 = true;
    }
  ).overrideAttrs (
    oldAttrs: rec {
      name = "${pname}-${version}";
      pname = (stdenv.lib.removeSuffix "-${oldAttrs.version}" oldAttrs.name) + "-unstable";
      version = "2019-10-07";

      src = builtins.fetchTarball {
        url = "https://git.savannah.gnu.org/cgit/emacs.git/snapshot/emacs-785dda9406e2bb2950cc23db42329c8fd8fb3868.tar.gz";
      };

      patches = [
        ../../patches/emacs/clean-env.patch
        <nixpkgs/pkgs/applications/editors/emacs/tramp-detect-wrapped-gvfsd.patch>
      ];
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
