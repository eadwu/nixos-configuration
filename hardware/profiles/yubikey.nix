{ config, pkgs, lib, ... }:
let
  yubikey-config = path: rec {
    twoFactor = true;
    slot = 2;
    saltLength = 64;
    keyLength = 64;
    iterationStep = 0;
    gracePeriod = 10;

    storage = {
      device = config.fileSystems."/boot".device;
      fsType = "vfat";
    } // { inherit path; };

    algo = {
      digest = {
        command = "argon2 $response -id -r -p 6 -t $iterations -l ${toString keyLength}";
        deps = ''
          copy_bin_and_libs ${pkgs.libargon2}/bin/argon2
        '';
      };

      challenge = {
        raw = true;
        command = "b3sum --raw --length ${toString keyLength}";
        deps = ''
          copy_bin_and_libs ${pkgs.b3sum}/bin/b3sum
        '';
      };
    };
  };
in
{
  boot.initrd.kernelModules = [ "vfat" "nls_cp437" "nls_iso8859-1" "usbhid" ];
  boot.initrd.luks.yubikeySupport = true;

  boot.initrd.luks.devices = lib.genAttrs
    [ "cryptroot" "cryptswap" ]
    (device: { bypassWorkqueues = true; yubikey = yubikey-config "/crypt-storage/${device}"; });

  environment.systemPackages = with pkgs; [
    pam_u2f
    yubico-pam
    yubioath-flutter
    yubikey-personalization
  ];

  services.pcscd.enable = true;
}
