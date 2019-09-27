{ ... }:

{
  boot.loader.systemd-boot = {
    enable = true;
    editor = false;
    memtest86.enable = true;
  };
}
