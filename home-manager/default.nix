{ systemConfig, pkgs, lib, ... }:

{
  imports = [
    ./zsh

    {
      programs.git.enable = true;
      programs.git.userName = "Edmund Wu";
      programs.git.userEmail = "22758444+eadwu@users.noreply.github.com";
      programs.git.extraConfig = {
        core = {
          autocrlf = "input";
          editor = "vim";
          excludesfile = pkgs._srcs + "/srcs/default-gitignore";
          fsmonitor = true;
          core.untrackedcache = true;
        };

        format = {
          signOff = true;
          coverLetter = true;
          coverFromDescription = "auto";
        };

        # Don't break existing branch names, may cause problems
        init.defaultBranch = "master";

        protocol.version = 2;
      };
    }
  ];

  xdg.enable = true;

  xdg.configFile."nixpkgs/config.nix".text =
    lib.generators.toPretty { } systemConfig.nixpkgs.config;
}
