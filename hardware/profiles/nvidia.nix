{ pkgs, ... }:

{
  imports =
    [
      ../gpu/nvidia
    ];

  environment = {
    systemPackages = with pkgs; [
      cudatoolkit
      glxinfo
    ];
  };
}
