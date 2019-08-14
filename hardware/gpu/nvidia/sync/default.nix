{ ... }:

{
  imports = [ ../. ];

  hardware.nvidia = {
    modesetting.enable = true;
    prime.sync.enable = true;
  };
}
