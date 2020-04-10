{
  name = "bcachefs";
  patch = ./bcachefs.patch;
  extraConfig = ''
    BCACHEFS_FS m

    AIO y
    DEVMEM y

    # https://bugzilla.redhat.com/show_bug.cgi?id=1615258
    DEBUG_SG n
  '';
}
