final: prev:
let
  lib = prev.lib;
in
builtins.listToAttrs (
  lib.flatten (
    map
      (
        filename: lib.mapAttrsToList
          (n: v: lib.nameValuePair n v)
          (import (./. + "/packages/${filename}") final prev)
      )
      (builtins.attrNames (lib.filterAttrs (_: v: v == "regular") (builtins.readDir ./packages)))
  )
)
