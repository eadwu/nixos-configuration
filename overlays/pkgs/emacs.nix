self: super:

let
  inherit (self) pkgs;
  inherit (pkgs) epkgs stdenv emacsPackagesNgGen;

  emacs27 = (super.emacs.override {
    srcRepo = true;
    withGTK2 = false;
    withGTK3 = true;
  }).overrideAttrs (oldAttrs: rec {
    name = "${pname}-${version}";
    pname = stdenv.lib.removeSuffix "-${oldAttrs.version}" oldAttrs.name;
    version = "unstable-2019-04-14";

    src = builtins.fetchGit {
      url = "https://git.savannah.gnu.org/git/emacs.git";
      rev = "661f44946d2bba21d16d718cf86372345c929a39";
      ref = "master";
    };

    patches = [
      ../../patches/emacs/clean-env.patch
      <nixpkgs/pkgs/applications/editors/emacs/tramp-detect-wrapped-gvfsd.patch>
    ];

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
  ]) ++ (with epkgs.orgPackages; [
    org
  ]));
}
