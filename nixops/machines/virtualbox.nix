{ lib, ... }:

{
  imports = [ ./. ];

  deployment.targetEnv = "virtualbox";
  deployment.virtualbox = {
    vcpu = lib.mkDefault 1;
    memorySize = lib.mkDefault 1024;
    headless = lib.mkDefault true;
  };
}
