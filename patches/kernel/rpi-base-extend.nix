# https://github.com/sakaki-/bcmrpi3-kernel-bis/blob/master/conform_config.sh
{
  name = "rpi-base-extend";
  patch = null;
  extraConfig = ''
    # enable basic KVM support; see e.g.
    # https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=210546&start=25#p1300453
    VIRTUALIZATION y
    KVM y
    VHOST_NET m
    VHOST_CROSS_ENDIAN_LEGACY y

    # enable ZSWAP support for better performance during large builds etc.
    # requires activation via kernel parameter or sysfs
    # see e.g. https://askubuntu.com/a/472227 for a summary of ZSWAP (vs ZRAM etc.)
    # and e.g. https://wiki.archlinux.org/index.php/zswap for parameters etc.
    ZPOOL y
    ZSWAP y
    ZBUD y
    Z3FOLD y
    ZSMALLOC y
    PGTABLE_MAPPING y

    # https://groups.google.com/forum/#!topic/linux.gentoo.user/_2aSc_ztGpA
    # https://github.com/torvalds/linux/blob/master/init/Kconfig#L848
    # Enables BPF syscall for systemd-journald firewalling
    BPF_SYSCALL y
    CGROUP_BPF y

    #See https://github.com/raspberrypi/linux/issues/2177#issuecomment-354647406
    # Netfilter kernel support
    # xtables
    NETFILTER_XTABLES m
    # Netfilter nf_tables support
    NF_TABLES m
    NETFILTER_XTABLES m
    NF_TABLES_BRIDGE m
    NF_NAT_SIP m
    NF_NAT_TFTP m
    NF_NAT_REDIRECT m
    NF_TABLES_INET m
    NF_TABLES_NETDEV m
    NF_TABLES_ARP m
    NF_DUP_IPV4 m
    NF_LOG_IPV4 m
    NF_REJECT_IPV4 m
    NF_NAT_IPV4 m
    NF_DUP_NETDEV m
    NF_DEFRAG_IPV4 m
    NF_CONNTRACK_IPV4 m
    NF_TABLES_IPV4 m
    NF_NAT_MASQUERADE_IPV4 m
    NF_NAT_SNMP_BASIC m
    NF_NAT_PROTO_GRE m
    NF_NAT_PPTP m
    NF_DEFRAG_IPV6 m
    NF_CONNTRACK_IPV6 m
    NF_TABLES_IPV6 m
    NF_DUP_IPV6 m
    NF_REJECT_IPV6 m
    NF_LOG_IPV6 m
    NF_NAT_IPV6 m
    NF_NAT_MASQUERADE_IPV6 m
    NFT_EXTHDR m
    NFT_META m
    NFT_NUMGEN m
    NFT_CT m
    NFT_SET_RBTREE m
    NFT_SET_HASH m
    NFT_COUNTER m
    NFT_LOG m
    NFT_LIMIT m
    NFT_MASQ m
    NFT_REDIR m
    NFT_NAT m
    NFT_QUEUE m
    NFT_QUOTA m
    NFT_REJECT m
    NFT_REJECT_INET m
    NFT_COMPAT m
    NFT_HASH m
    NFT_DUP_NETDEV m
    NFT_FWD_NETDEV m
    NFT_CHAIN_ROUTE_IPV4 m
    NFT_REJECT_IPV4 m
    NFT_DUP_IPV4 m
    NFT_CHAIN_NAT_IPV4 m
    NFT_MASQ_IPV4 m
    NFT_REDIR_IPV4 m
    NFT_CHAIN_ROUTE_IPV6 m
    NFT_REJECT_IPV6 m
    NFT_DUP_IPV6 m
    NFT_CHAIN_NAT_IPV6 m
    NFT_MASQ_IPV6 m
    NFT_REDIR_IPV6 m
    NFT_BRIDGE_META m
    NFT_BRIDGE_REJECT m
    IP_SET_BITMAP_IPMAC m
    IP_SET_BITMAP_PORT m
    IP_SET_HASH_IP m
    IP_SET_HASH_IPMARK m
    IP_SET_HASH_IPPORT m
    IP_SET_HASH_IPPORTIP m
    IP_SET_HASH_IPPORTNET m
    IP_SET_HASH_MAC m
    IP_SET_HASH_NETPORTNET m
    IP_SET_HASH_NET m
    IP_SET_HASH_NETNET m
    IP_SET_HASH_NETPORT m
    IP_SET_HASH_NETIFACE m
    IP_SET_LIST_SET m
    IP6_NF_IPTABLES m
    IP6_NF_MATCH_AH m
    IP6_NF_MATCH_EUI64 m
    IP6_NF_NAT m
    IP6_NF_TARGET_MASQUERADE m
    IP6_NF_TARGET_NPT m
    NF_LOG_BRIDGE m
    BRIDGE_NF_EBTABLES m
    BRIDGE_EBT_BROUTE m
    BRIDGE_EBT_T_FILTER m

    # Enable VLAN support again (its in armv7 configs)
    IPVLAN m

    # Enable per-interface network priority control
    # (for systemd-nspawn)
    CGROUP_NET_PRIO y
  '';
}
