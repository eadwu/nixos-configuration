final: prev:

{
  qemu = prev.qemu.overrideAttrs (oldAttrs: {
    patches = (oldAttrs.patches or [])
      ++ [ ../../patches/qemu/lower-gui-refresh-interval.patch ];
  });
}
