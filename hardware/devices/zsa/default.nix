{ pkgs, ... }:

{
  environment.systemPackages =
    with pkgs;
    [
      wally-cli
    ];

  hardware.keyboard.zsa.enable = true;
}
