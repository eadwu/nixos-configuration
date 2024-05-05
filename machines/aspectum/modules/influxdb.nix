{ options, config, pkgs, lib, modulesPath, ... }:

{
  systemd.services.influxdb2.environment.INFLUXD_CONFIG_PATH = let
    jsonGenerator = pkgs.formats.json { };
    configuration = jsonGenerator.generate "config.json" config.services.influxdb2.settings;
  in lib.mkForce (pkgs.runCommand "influxdb2-configuration" {} ''
    mkdir -p $out
    cp ${configuration} $out/config.json
  '');

  environment.systemPackages = with pkgs; [ influxdb2-cli ];

  services.influxdb2.enable = true;
  services.influxdb2.settings = {
    http-bind-address = "127.0.0.1:8086";
  };

  systemd.services.influxdb2.serviceConfig = {
    MemoryAccounting = "true";
    MemoryHigh = "2G";
  };
}