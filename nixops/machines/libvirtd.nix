{ lib, ... }:

{
  imports =
    [
      ./.
      <nixpkgs/nixos/modules/profiles/qemu-guest.nix>
    ];

  deployment.targetEnv = "libvirtd";
  deployment.libvirtd = {
    vcpu = lib.mkDefault 1;
    memorySize = lib.mkDefault 1024;
    headless = lib.mkDefault true;
    baseImageSize = lib.mkDefault 10;
  };

  # See https://github.com/NixOS/nixops/issues/931
  system.activationScripts.nixops-vm-fix-931 = ''
    if ls -l /nix/store | grep sudo | grep -q nogroup; then
      mount -o remount,rw /nix/store
      chown -R root:nixbld /nix/store
    fi
  '';
}
