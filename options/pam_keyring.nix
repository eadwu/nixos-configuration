{ lib, ... }:

with lib;

{
  # Keyring issue for bcachefs
  # See https://github.com/NixOS/nixpkgs/issues/32279
  # Do this "natively" from upstream nixpkgs
  # See https://github.com/NixOS/nixpkgs/pull/49506#issuecomment-492823372
  options.security.pam.services = mkOption {
    type = types.loaOf (
      types.submodule {
        config.text = mkDefault (mkAfter "session required pam_keyinit.so force revoke");
      }
    );
  };
}
