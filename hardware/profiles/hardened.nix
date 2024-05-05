{ pkgs, lib, ... }:

# https://madaidans-insecurities.github.io/guides/linux-hardening.html
# 2023-04-17
with lib;

let
  mkDefault = mkOverride 400;
in{
  # 2.2.1 Kernel self-protection

  # Hide kptrs even for processes with CAP_SYSLOG
  boot.kernel.sysctl."kernel.kptr_restrict" = mkDefault "2";

  # Restrict dmesg to processes with CAP_SYSLOG
  boot.kernel.sysctl."kernel.dmesg_restrict" = mkDefault "1";

  # Don't display kernel log during boot
  # boot.consoleLogLevel = mkDefault 3;
  # boot.kernel.sysctl."kernel.printk" = mkDefault "3 3 3 3";

  # Restrict eBPF to CAP_BPF or CAP_SYS_ADMIN
  boot.kernel.sysctl."kernel.unprivileged_bpf_disabled" = mkDefault "1";
  boot.kernel.sysctl."net.core.bpf_jit_harden" = mkDefault "2";

  # Restrict loading TTY line disciplines to CAP_SYS_MODULE
  boot.kernel.sysctl."dev.tty.ldisc_autoload" = mkDefault "0";

  # Restrict userfaultfd() to CAP_SYS_PTRACE
  boot.kernel.sysctl."vm.unprivileged_userfaultfd" = mkDefault "0";

  # Turn off kexec, even if it's built in.
  boot.kernel.sysctl."kernel.kexec_load_disabled" = mkDefault "1";

  # Restrict SysRq
  # boot.kernel.sysctl."kernel.sysrq" = mkDefault "4";

  # Disable user namespaces
  # boot.kernel.sysctl."kernel.unprivileged_userns_clone" = mkDefault "0";

  # Restrict performance events to CAP_PERFMON
  boot.kernel.sysctl."kernel.perf_event_paranoid" = mkDefault "3";

  # 2.2.2 Network

  # Protect against SYN flood attacks
  boot.kernel.sysctl."net.ipv4.tcp_syncookies" = mkDefault "1";

  # Protect against time-wait assassination
  boot.kernel.sysctl."net.ipv4.tcp_rfc1337" = mkDefault "1";

  # Protect against IPv4 spoofing (source validation)
  boot.kernel.sysctl."net.ipv4.conf.all.rp_filter" = mkDefault "1";
  boot.kernel.sysctl."net.ipv4.conf.default.rp_filter" = mkDefault "1";

  # Ignore incoming ICMP redirects (note: default is needed to ensure that the
  # setting is applied to interfaces added after the sysctls are set)
  boot.kernel.sysctl."net.ipv4.conf.all.accept_redirects" = mkDefault "0";
  boot.kernel.sysctl."net.ipv4.conf.all.secure_redirects" = mkDefault "0";
  boot.kernel.sysctl."net.ipv4.conf.default.accept_redirects" = mkDefault "0";
  boot.kernel.sysctl."net.ipv4.conf.default.secure_redirects" = mkDefault "0";
  boot.kernel.sysctl."net.ipv6.conf.all.accept_redirects" = mkDefault "0";
  boot.kernel.sysctl."net.ipv6.conf.default.accept_redirects" = mkDefault "0";

  # Ignore outgoing ICMP redirects (this is ipv4 only)
  boot.kernel.sysctl."net.ipv4.conf.all.send_redirects" = mkDefault "0";
  boot.kernel.sysctl."net.ipv4.conf.default.send_redirects" = mkDefault "0";

  # Ignore ICMP requests to avoid Smurf attacks
  boot.kernel.sysctl."net.ipv4.icmp_echo_ignore_all" = mkDefault "1";

  # Disable source routing (MITM)
  boot.kernel.sysctl."net.ipv4.conf.all.accept_source_route" = mkDefault "0";
  boot.kernel.sysctl."net.ipv4.conf.default.accept_source_route" = mkDefault "0";
  boot.kernel.sysctl."net.ipv6.conf.all.accept_source_route" = mkDefault "0";
  boot.kernel.sysctl."net.ipv6.conf.default.accept_source_route" = mkDefault "0";

  # Disable IPv6 router advertisements (MITM)
  boot.kernel.sysctl."net.ipv6.conf.all.accept_ra" = mkDefault "0";
  boot.kernel.sysctl."net.ipv6.conf.default.accept_ra" = mkDefault "0";

  # Disable TCP SACK
  boot.kernel.sysctl."net.ipv4.tcp_sack" = mkDefault "0";
  boot.kernel.sysctl."net.ipv4.tcp_dsack" = mkDefault "0";
  boot.kernel.sysctl."net.ipv4.tcp_fack" = mkDefault "0";

  # 2.2.3 Userspace

  # Restrict ptrace to CAP_SYS_PTRACE, 3 disables ptrace
  boot.kernel.sysctl."kernel.yama.ptrace_scope" = mkDefault "2";

  # Increase ASLR bits of entropy (in relation to architecture x86 values below)
  # boot.kernel.sysctl."vm.mmap_rnd_bits" = mkDefault "32";
  # boot.kernel.sysctl."vm.mmap_rnd_compat_bits" = mkDefault "16";

  # Only permits symlink to be followed when outside of a world-writable sticky directory
  #   if permissions match
  boot.kernel.sysctl."fs.protected_symlinks" = mkDefault "1";
  boot.kernel.sysctl."fs.protected_hardlinks" = mkDefault "1";

  # Prevent creating files in potentially attacker-controlled environments
  # boot.kernel.sysctl."fs.protected_fifos" = mkDefault "2";
  # boot.kernel.sysctl."fs.protected_regular" = mkDefault "2";

  boot.kernelParams = [
    # 2.3.1 Kernel self-protection

    # Disable slab merging
    "slab_nomerge"

    # Wipe allocations on allocation and free
    "init_on_alloc=1"
    "init_on_free=1"

    # Enable page allocator randomization
    "page_alloc.shuffle=1"

    # Kernel Page Table Isolation
    "pti=on"

    # Randomize kernel offset
    "randomize_kstack_offset=on"

    # Disable vsyscalls
    "vsyscall=none"

    # Disable debugfs
    "debugfs=off"

    # Panic on oops
    # "oops=panic"

    # Enforce kernel module signatures
    # "module.sig_enforce=1"

    # Kernel Lockdown LSM
    # "lockdown=confidentiality"

    # Panic on uncorrectable errors in [ECC] memory
    # "mce=0"

    # Prevent information leaks during boot
    # "quiet"
    # "loglevel=0"

    # CPU Mitigations
    # "spectre_v2=on"
    # "spec_store_bypass_disable=on"
    # "tsx=off"
    # "tsx_async_abort=full,nosmt"
    # "mds=full,nosmt"
    # "l1tf=full,force"
    # "nosmt=force"
    # "kvm.nx_huge_pages=force"

    # 18.2 RDRAND (CPU RNG)
    "random.trust_cpu=off"

    # 21.6 DMA attacks
    "intel_iommu=on"
    "amd_iommu=on"
    "efi=disable_early_pci_dma"
  ];

  # 2.5.2 Blacklisting kernel modules
  boot.blacklistedKernelModules = [
    # Obscure network protocols
    # Datagram Congestion Control Protocol
    "dccp"
    # Stream Control Transmission Protocol
    "sctp"
    # Reliable Datagram Sockets
    "rds"
    # Transparent Inter-process Communication
    "tipc"
    # High-Level Data Link Control
    "n-hdlc"
    # Amateur X.25
    "ax25"
    "netrom"
    "x25"
    "rose"
    "decnet"
    "econet"
    # IEEE 802.15.4
    "af_802154"
    # Internetwork Packet Exchange
    "ipx"
    "appletalk"
    # Subnetwork Access Protocol
    "psnap"
    # Novell raw IEEE 802.3
    "p8023"
    # IEEE 802.2
    "p8022"
    # Controller Area Network
    "can"
    "atm"

    # Old or rare or insufficiently audited filesystems
    "cramfs"
    "freevxfs"
    "jffs2"
    "hfs"
    "hfsplus"
    "squashfs"
    "udf"

    # Network filesystems
    "cifs"
    # "nfs"
    # "nfsv3"
    # "nfsv4"
    "ksmbd"
    "gfs2"

    # Only useful for testing purposes
    "vivid"

    # Bluetooth
    # "bluetooth"
    # "btusb"

    # Webcam
    "uvcvideo"

    # Audio/Microphone/Speaker
    # "snd_hda_intel"

    # 21.6 DMA attacks
    "firewire-core"
    # "thunderbolt"
  ];

  # 5 Hardened Malloc
  boot.kernel.sysctl."vm.max_map_count" = mkDefault "1048576";

  # 12 Core dumps
  boot.kernel.sysctl."kernel.core_pattern" = mkDefault "|${pkgs.coreutils}/bin/false";
  boot.kernel.sysctl."fs.suid_dumpable" = mkDefault "0";

  # 13 Swap
  boot.kernel.sysctl."vm.swappiness" = mkDefault "1";

  # 16 IPv6 Privacy Extensions
  boot.kernel.sysctl."net.ipv6.conf.all.use_tempaddr" = mkDefault "2";
  boot.kernel.sysctl."net.ipv6.conf.default.use_tempaddr" = mkDefault "2";

  # 16.2 systemd-networkd
  systemd.network.networks."ipv6-privacy" = {
    networkConfig.IPv6PrivacyExtensions = "kernel";
  };

  # 17 Mount options
  # fileSystems."/".options = lib.mk
# /        /          ext4    defaults                              1 1
# /home    /home      ext4    defaults,nosuid,noexec,nodev          1 2
# /tmp     /tmp       ext4    defaults,bind,nosuid,noexec,nodev     1 2
# /var     /var       ext4    defaults,bind,nosuid                  1 2
# /boot    /boot      ext4    defaults,nosuid,noexec,nodev          1 2
}
