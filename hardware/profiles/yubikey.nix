{ config, pkgs, ... }:

let
  yubikey-config = path: {
    twoFactor = true;
    slot = 2;
    saltLength = 64;
    keyLength = 64;
    iterationStep = 0;
    gracePeriod = 30;

    storage = {
      device = config.fileSystems."/boot".device;
      fsType = "vfat";
    } // { inherit path; };
  };
in
{
  boot.initrd.kernelModules = [ "vfat" "nls_cp437" "nls_iso8859-1" "usbhid" ];
  boot.initrd.luks.yubikeySupport = true;

  boot.initrd.luks.devices."cryptroot".yubikey = yubikey-config "/crypt-storage/cryptroot";
  boot.initrd.luks.devices."cryptswap".yubikey = yubikey-config "/crypt-storage/cryptswap";

  environment.systemPackages = with pkgs; [ pam_u2f yubikey-personalization ];

  hardware.u2f.enable = true;
  security.pam.u2f.enable = true;
  security.pam.u2f.control = "required";
}
