{ pkgs, lib, ... }:

let
  gitignore = pkgs.stdenv.mkDerivation {
    name = "gitignore";

    outputHash = "044iccjc4vz4rz3hc2mqls48ir8llx0pxhv0jk1algarihgxhlhwj2mraswnfc0ckg0ss53ckcrlkq4cxsm1w5ql200jpqqb8jdl2ww";
    outputHashAlgo = "sha512";
    outputHashMode = "flat";

    buildInputs = lib.singleton pkgs.wget;

    buildCommand = ''
      wget "https://www.gitignore.io/api/c,r,git,c++,java,rust,cmake,elisp,emacs,latex,linux,macos,haskell,database,intellij,visualstudiocode" \
        --ca-certificate=${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt \
        -O $out
    '';
  };

  queryWatchman = pkgs.runCommand "fsmonitor-watchman" {
    src = "${pkgs.git}/share/git-core/templates/hooks/fsmonitor-watchman.sample";
    buildInputs = lib.singleton pkgs.gnused;
  } ''
    sed 's@/usr@${pkgs.perl}@' $src > $out
    chmod +x $out
  '';
in {
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = "Edmund Wu";
    userEmail = "fangkazuto@gmail.com";

    signing = {
      key = "76AA3F9F2BD3E3A0";
      signByDefault = true;
    };

    extraConfig = ''
      [alias]
        plfs = !git -c filter.lfs.smudge= -c filter.lfs.required=false pull && git lfs pull

      [core]
        autocrlf = input
        editor = vim
        excludesfile = ${gitignore}
        fsmonitor = ${queryWatchman}

      [lfs]
        pruneverifyremotealways = true

      [protocol]
        version = 2

      [filter "lfs"]
        clean = ${pkgs.git-lfs}/bin/git-lfs clean -- %f
        smudge = ${pkgs.git-lfs}/bin/git-lfs smudge -- %f
        process = ${pkgs.git-lfs}/bin/git-lfs filter-process
        required = true
    '';
  };
}
