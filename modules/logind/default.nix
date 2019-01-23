{ ... }:

assert builtins.pathExists ./logind.conf;

{
  services.logind.extraConfig = builtins.readFile ./logind.conf;
}
