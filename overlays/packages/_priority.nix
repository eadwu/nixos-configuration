final: prev:

{
  # lowPrio is 10, but 10 is default ...
  busybox = final.pkgs.lib.setPrio 10000 prev.busybox;
  # prefer coreutils over busybox but specific binaries over coreutils
  coreutils = final.pkgs.lib.setPrio 9000 prev.coreutils;
}
