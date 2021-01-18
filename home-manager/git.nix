{ flakes, pkgs, ... }:
let
  queryWatchman =
    with pkgs;
    runCommand "fsmonitor-watchman"
      {
        src = "${_aliases.git}/share/git-core/templates/hooks/fsmonitor-watchman.sample";
        buildInputs = [ gnused ];
      } ''
      sed 's@/usr@${perl}@' $src > $out
      chmod +x $out
    '';
in
{
  programs.git = {
    enable = true;
    package = pkgs._aliases.git;
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
        excludesfile = toString flakes.default-gitignore.path;
        fsmonitor = queryWatchman.outPath;
      };

      format = {
        signOff = true;
        coverLetter = true;
        coverFromDescription = "auto";
      };

      # Don't break existing branch names, may cause problems
      init.defaultBranch = "master";

      lfs.pruneverifyremotealways = true;

      protocol.version = 2;

      "filter \"lfs\"" = {
        clean = "${pkgs.git-lfs}/bin/git-lfs clean -- %f";
        smudge = "${pkgs.git-lfs}/bin/git-lfs smudge -- %f";
        process = "${pkgs.git-lfs}/bin/git-lfs filter-process";
        required = true;
      };
    };
  };
}
