{ pkgs, lib, ... }:

{
  imports =
    [
      <nixpkgs/nixos/modules/installer/cd-dvd/sd-image-aarch64-new-kernel.nix>
    ];

  boot.zfs.enableUnstable = true;
  networking.hostName = "aarch64";
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  systemd.services.sshd.wantedBy = lib.mkForce [ "multi-user.target" ];
  users.users.root.initialHashedPassword = lib.mkForce "$6$uQrouMul3IyTEDx$fv6DHCRTL0zeNoQ3/pbnp3qaPqhO5cEUKyvPrpvYzcazvN9yIF2fH/CF0ddy4QsXeE9yMniFUj98NppcMr6nT0";
}
