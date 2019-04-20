{
  name = "harden-kernel";
  patch = null;
  extraConfig = ''
    SECURITY_DMESG_RESTRICT y
  '';
}
