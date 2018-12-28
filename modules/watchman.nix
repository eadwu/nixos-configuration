{ pkgs, ... }:

{
  boot = {
    kernel = {
      sysctl = {
        "fs.inotify.max_user_instances" = 1024;
        "fs.inotify.max_user_watches" = 524288;
      };
    };
  };

  environment = {
    systemPackages = with pkgs; [
      watchman
    ];
  };
}
