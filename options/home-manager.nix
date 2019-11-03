{ lib, ... }:

with lib;

{
  options.sysConfig = mkOption {
    default = {};
    description = ''
      The system NixOS configuration.
    '';
  };
}
