{
  name = "bcachefs";
  patch = ./bcachefs.patch;
  extraConfig = ''
    BCACHEFS_FS m
  '';
}
