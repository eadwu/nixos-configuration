{
  name = "bcachefs-support";
  patch = ./bcachefs-support.patch;
  extraConfig = ''
    BCACHEFS_FS m
  '';
}
