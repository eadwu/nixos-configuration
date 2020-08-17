{ pkgs, ... }:

with pkgs;

let
  gitignore = stdenv.mkDerivation {
    name = "gitignore";

    outputHash = "sha512-j/3WGfXt6yeUul2rJ+jn6KEB5yO20ZHofrbcbdAlWBswjfiSZKYdYYiv4MmQGqfv8immCH42fOE/b1+zvU5T8g==";
    outputHashAlgo = "sha512";
    outputHashMode = "flat";

    buildInputs = [ wget ];

    buildCommand = ''
      wget "https://www.gitignore.io/api/c,r,git,c++,java,rust,cmake,elisp,emacs,latex,linux,macos,scala,haskell,database,intellij,visualstudiocode" \
        --ca-certificate=${cacert}/etc/ssl/certs/ca-bundle.crt \
        -O $out
    '';
  };

  queryWatchman = runCommand "fsmonitor-watchman" {
    src = "${git}/share/git-core/templates/hooks/fsmonitor-watchman.sample";
    buildInputs = [ gnused ];
  } ''
    sed 's@/usr@${perl}@' $src > $out
    chmod +x $out
  '';
in
{
  programs.git = {
    enable = true;
    package = gitAndTools.gitFull;
    userName = "Edmund Wu";
    userEmail = "fangkazuto@gmail.com";

    signing = {
      key = "0D62311F6343DE1A";
      signByDefault = true;
    };

    extraConfig = {
      alias.plfs = "!git -c filter.lfs.smudge= -c filter.lfs.required=false pull && git lfs pull";

      core = {
        autocrlf = "input";
        editor = "vim";
        excludesfile = gitignore.outPath;
        fsmonitor = queryWatchman.outPath;
      };

      format = {
        signOff = true;
        coverLetter = true;
        coverFromDescription = "auto";
      };

      lfs.pruneverifyremotealways = true;

      protocol.version = 2;

      "filter \"lfs\"" = {
        clean = "${git-lfs}/bin/git-lfs clean -- %f";
        smudge = "${git-lfs}/bin/git-lfs smudge -- %f";
        process = "${git-lfs}/bin/git-lfs filter-process";
        required = true;
      };
    };
  };
}
