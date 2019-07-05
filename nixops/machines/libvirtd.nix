{ lib, ... }:

# NOTE: Satisfy prequisites
# See https://github.com/NixOS/nixops/blob/4fba1797311d881a7170943b231b922f72b80f67/doc/manual/overview.xml#L1535..L1542
assert builtins.pathExists /var/lib/libvirt/images;

{
  deployment = {
    targetEnv = "libvirtd";
    libvirtd = {
      vcpu = lib.mkDefault 1;
      memorySize = lib.mkDefault 1024;
      headless = lib.mkDefault true;
      baseImageSize = lib.mkDefault 10;
    };
  };

  # See https://github.com/NixOS/nixops/issues/931
  system.activationScripts.nixops-vm-fix-931 = {
    deps = [];
    text = ''
      if ls -l /nix/store | grep sudo | grep -q nogroup; then
        mount -o remount,rw /nix/store
        chown -R root:nixbld /nix/store
      fi
    '';
  };
}
