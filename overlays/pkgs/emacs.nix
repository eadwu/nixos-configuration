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
      pname = stdenv.lib.removeSuffix "-${oldAttrs.version}" oldAttrs.name;
      version = "2020-03-08";

      src = builtins.fetchTarball {
        url = "https://git.savannah.gnu.org/cgit/emacs.git/snapshot/emacs-a461baae79af3cea8780e9d9a845a1e859e96e5e.tar.gz";
      };

      patches = [
        ../../patches/emacs/clean-env.patch
        ../../patches/emacs/tramp-detect-wrapped-gvfsd.patch
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
