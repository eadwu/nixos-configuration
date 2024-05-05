{ config, lib, pkgs, ... }:

with lib;

let

  cfg = config.zramSwap;

  # don't set swapDevices as mkDefault, so we can detect user had read our warning
  # (see below) and made an action (or not)
  devicesCount = if cfg.swapDevices != null then cfg.swapDevices else cfg.numDevices;

  devices = map (nr: "zram${toString nr}") (range 0 (devicesCount - 1));

  warnings =
  assert cfg.swapDevices != null -> cfg.numDevices >= cfg.swapDevices;
  flatten [
    (optional (cfg.numDevices > 1 && cfg.swapDevices == null) ''
      Using several small zram devices as swap is no better than using one large.
      Set either zramSwap.numDevices = 1 or explicitly set zramSwap.swapDevices.

      Previously multiple zram devices were used to enable multithreaded
      compression. Linux supports multithreaded compression for 1 device
      since 3.15. See https://lkml.org/lkml/2014/2/28/404 for details.
    '')
  ];

in

{

  ###### interface

  options = {

    zramSwap = {

      enable = mkOption {
        default = false;
        type = types.bool;
        description = lib.mdDoc ''
          Enable in-memory compressed devices and swap space provided by the zram
          kernel module.
          See [
            https://www.kernel.org/doc/Documentation/blockdev/zram.txt
          ](https://www.kernel.org/doc/Documentation/blockdev/zram.txt).
        '';
      };

      numDevices = mkOption {
        default = 1;
        type = types.int;
        description = lib.mdDoc ''
          Number of zram devices to create. See also
          `zramSwap.swapDevices`
        '';
      };

      swapDevices = mkOption {
        default = null;
        example = 1;
        type = with types; nullOr int;
        description = lib.mdDoc ''
          Number of zram devices to be used as swap. Must be
          `<= zramSwap.numDevices`.
          Default is same as `zramSwap.numDevices`, recommended is 1.
        '';
      };

      memoryPercent = mkOption {
        default = 50;
        type = types.int;
        description = lib.mdDoc ''
          Maximum total amount of memory that can be stored in the zram swap devices
          (as a percentage of your total memory). Defaults to 1/2 of your total
          RAM. Run `zramctl` to check how good memory is compressed.
          This doesn't define how much memory will be used by the zram swap devices.
        '';
      };

      memoryMax = mkOption {
        default = null;
        type = with types; nullOr int;
        description = lib.mdDoc ''
          Maximum total amount of memory (in bytes) that can be stored in the zram
          swap devices.
          This doesn't define how much memory will be used by the zram swap devices.
        '';
      };

      priority = mkOption {
        default = 5;
        type = types.int;
        description = lib.mdDoc ''
          Priority of the zram swap devices. It should be a number higher than
          the priority of your disk-based swap devices (so that the system will
          fill the zram swap devices before falling back to disk swap).
        '';
      };

      algorithm = mkOption {
        default = "zstd";
        example = "lz4";
        type = with types; either (enum [ "lzo" "lz4" "zstd" ]) str;
        description = lib.mdDoc ''
          Compression algorithm. `lzo` has good compression,
          but is slow. `lz4` has bad compression, but is fast.
          `zstd` is both good compression and fast, but requires newer kernel.
          You can check what other algorithms are supported by your zram device with
          {command}`cat /sys/class/block/zram*/comp_algorithm`
        '';
      };
    };

  };

  config = mkIf cfg.enable {

    inherit warnings;

    wsl.bootCommand = lib.mkBefore (''
        # Calculate memory to use for zram
        mem=$(${pkgs.gawk}/bin/awk '/MemTotal: / {
            value=int($2*${toString cfg.memoryPercent}/100.0/${toString devicesCount}*1024);
            ${lib.optionalString (cfg.memoryMax != null) ''
                memory_max=int(${toString cfg.memoryMax}/${toString devicesCount});
                if (value > memory_max) { value = memory_max }
            ''}
            print value
        }' /proc/meminfo)
    '' + (lib.concatMapStringsSep "\n" 
      (device: ''
        # echo ${cfg.algorithm} > /sys/block/${device}/comp_algorithm
        # echo $mem > /sys/block/${device}/disksize
        ${pkgs.util-linux}/sbin/zramctl --size $mem --algorithm ${cfg.algorithm} /dev/${device}
        ${pkgs.util-linux}/sbin/mkswap --label ${device} /dev/${device}
        ${pkgs.util-linux}/sbin/swapon --priority 100 /dev/${device}
      '') 
      devices)
    );

  };

}