{ modulesPath, config, pkgs, lib, ... }:
let
  # i.e. u2f-luks cryptswap /dev/nvme0n1p5 [SALT_LENGTH [KEY_LENGTH [ITERATIONS [STORAGE]]]]
  # i.e. u2f-luks cryptroot /dev/nvme0n1p6 [SALT_LENGTH [KEY_LENGTH [ITERATIONS [STORAGE]]]]
  u2f-luks = pkgs.writeScriptBin "u2f-luks" ''
    #! /usr/bin/env nix-shell
    #! nix-shell -i bash -p b3sum libargon2 cryptsetup yubikey-personalization
    NAME=$1
    PARTITION=$2

    SALT_LENGTH=''${3:-64}
    KEY_LENGTH=''${4:-512}
    ITERATIONS=''${5:-1000}

    EFI_MNT=''${6:-/boot}
    STORAGE=/crypt-storage/$NAME

    TMPDIR=$(mktemp -d)

    rbtohex() {
      ( od -An -vtx1 | tr -d ' \n' )
    }

    hextorb() {
      ( tr '[:lower:]' '[:upper:]' | sed -e 's/\([0-9A-F]\{2\}\)/\\\\\\x\1/gI'| xargs printf )
    }

    mkdir -p $TMPDIR/crypt-ramfs
    mount -t ramfs none $TMPDIR/crypt-ramfs
    mkdir -p "$(dirname $EFI_MNT$STORAGE)"

    # ykpersonalize -v -2 -ochal-resp -ochal-hmac -ohmac-lt64 -oserial-api-visible # challenge-response
    # ykpersonalize -v -2 -ochal-resp -ochal-hmac -ohmac-lt64 -oserial-api-visible -ochal-btn-trig # require tap
    echo "Enter password for $PARTITION ... "
    IFS= read -r -s k_user
    salt=""
    for i in $(seq $SALT_LENGTH); do
        byte="$(dd if=/dev/random bs=1 count=1 2>/dev/null | rbtohex)";
        salt="$salt$byte";
    done
    challenge="$(echo -n $salt | b3sum --raw --length $(($KEY_LENGTH / 8)) | rbtohex)"
    echo "Waiting for Yubikey response ... "
    response="$(ykchalresp -2 -x $challenge 2>/dev/null)"
    k_luks="$(echo -n $k_user | argon2 $response -id -r -p 6 -t $ITERATIONS -l $(($KEY_LENGTH / 8)))"
    echo -n $k_luks | hextorb > $TMPDIR/crypt-ramfs/key
    printf "%s\n%s" "$salt" "$ITERATIONS" > $EFI_MNT$STORAGE
    echo "$k_user" | cryptsetup luksKillSlot --type luks2 --verbose $PARTITION 1
    echo "$k_user" | cryptsetup luksKillSlot --type luks2 --verbose $PARTITION 2
    echo "$k_user" | cryptsetup luksAddKey --type luks2 --verbose $PARTITION $TMPDIR/crypt-ramfs/key
    echo -n "$k_luks" | hextorb | cryptsetup open --type luks2 --key-file=- --test-passphrase --verbose $PARTITION

    umount $TMPDIR/crypt-ramfs
  '';

  # i.e. test-luks cryptswap /dev/nvme0n1p5
  # i.e. test-luks cryptroot /dev/nvme0n1p6
  test-luks = pkgs.writeScriptBin "test-luks" ''
    #! /usr/bin/env nix-shell
    #! nix-shell -i bash -p b3sum libargon2 cryptsetup yubikey-personalization
    NAME=$1
    PARTITION=$2

    rbtohex() {
      ( od -An -vtx1 | tr -d ' \n' )
    }

    hextorb() {
      ( tr '[:lower:]' '[:upper:]' | sed -e 's/\([0-9A-F]\{2\}\)/\\\\\\x\1/gI'| xargs printf )
    }

    salt="$(cat /boot/crypt-storage/$NAME | sed -n 1p | tr -d '\n')"
    iterations="$(cat /boot/crypt-storage/$NAME | sed -n 2p | tr -d '\n')"
    challenge="$(echo -n $salt | b3sum --raw --length $(($KEY_LENGTH / 8)) | rbtohex)"
    echo "Waiting for Yubikey response ... "
    response="$(ykchalresp -2 -x $challenge 2>/dev/null)"
    echo "Enter password for $PARTITION ... "
    IFS= read -r -s k_user
    k_luks="$(echo -n $k_user | argon2 $response -id -r -p 6 -t $iterations -l 64)"
    echo -n $k_luks | hextorb | cryptsetup open --type luks2 --key-file=- --test-passphrase --verbose $PARTITION
  '';

  # i.e. u2f-user [HOME]
  u2f-user = pkgs.writeShellScriptBin "u2f-user" ''
    HOME=''${1:-~}

    rm -rf $HOME/.config/Yubico
    mkdir -p $HOME/.config/Yubico
    pamu2fcfg > $HOME/.config/Yubico/u2f_keys
  '';

  # https://wiki.archlinux.org/index.php/Parted#Check_alignment
  check-alignment = pkgs.writeShellScriptBin "check-alignment" ''
    DEVICE=''${1}

    parted $DEVICE
    # align-check optimal 1
  '';
in
{
  imports =
    [
      ../hardware/gpu/nvidia/disable
      # "${modulesPath}/installer/cd-dvd/installation-cd-graphical-plasma5-new-kernel.nix"
      "${modulesPath}/installer/cd-dvd/installation-cd-minimal-new-kernel-no-zfs.nix"
    ];

  documentation.enable = false;

  boot.supportedFilesystems = [ "bcachefs" ];
  boot.kernelPackages = lib.mkOverride (-1000001) (pkgs.customLinuxPackagesFor pkgs.linuxKernel.kernels.linux_testing);
  nixpkgs.overlays = [(final: super: {
    zfs = super.zfs.overrideAttrs (_: { meta.platforms = []; });
    zfsStable = super.zfsStable.overrideAttrs (_: { meta.platforms = []; });
    zfsUnstable = super.zfsUnstable.overrideAttrs (_: { meta.platforms = []; });
  })];

  # boot.kernelPackages = lib.mkOverride (-1000001) (pkgs.customLinuxPackagesFor config.boot.zfs.package.latestCompatibleLinuxPackages.kernel);
  # boot.zfs.package = pkgs.zfs_unstable;
  # boot.kernel.randstructSeed = "9f5cf1fa55b2006de3cef6d00a8481427ccc621bfa69c2c02795b954e0269535";

  console = {
    earlySetup = true;
    font = "ter-u28n";
    packages = [ pkgs.terminus_font ];
  };

  environment = {
    memoryAllocator.provider = "libc";

    systemPackages = with pkgs; [
      git
      emacs
      mkpasswd
      dd_rescue

      u2f-luks
      test-luks
      u2f-user

      wpa_supplicant
    ];
  };

  hardware.enableRedistributableFirmware = true;

  # networking.wireless.enable = lib.mkForce false;
  services.dbus.packages = [ pkgs.wpa_supplicant ];
  # services.udev.packages = [ pkgs.crda ];

  /*
  nix = {
    registry = {
        nixpkgs = lib.mkForce {
          from = { type = "indirect"; id = "nixpkgs"; };
          to = { type = "github"; owner = "eadwu"; repo = "nixpkgs"; ref = "develop"; };
        };
      };
  };
  */

  isoImage = {
    # compressImage = true;
    includeSystemBuildDependencies = true;

/*
    contents = [
      {
        source = ./..;
        target = "nixos-configuration";
      }
      {
        source = builtins.toPath pkgs.path;
        target = "nixpkgs";
      }
    ];
*/
  };

  nixpkgs.config.allowUnfree = true;
}
