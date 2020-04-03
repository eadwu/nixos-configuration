{
  name = "lockdown";
  patch = null;
  extraConfig = ''
    SECURITY_LOCKDOWN_LSM y
    SECURITY_LOCKDOWN_LSM_EARLY y
    LOCK_DOWN_KERNEL_FORCE_NONE y
  '';
}
