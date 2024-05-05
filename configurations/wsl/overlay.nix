final: prev:

{
  dnstap = final.callPackage ./packages/dnstap.nix { };

  ohmgraphite = final.callPackage ./packages/ohmgraphite.nix { };
 
  influx2cortex = final.callPackage ./packages/influx2cortex.nix { };

  mimir-proxies = final.callPackage ./packages/mimir-proxies.nix { };

  promu = final.callPackage ./packages/promu.nix { };

  sudppipe = final.callPackage ./packages/sudppipe.nix {};

  windows_exporter = final.callPackage ./packages/windows_exporter.nix { inherit (final.buildPackages) promu; };  
}
