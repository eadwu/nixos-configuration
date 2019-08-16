self: super:

with self.pkgs; {
  linux_rpi_4_19 = (super.linux_rpi.override {
    argsOverride = rec {
      version = "4.19.66";
      modDirVersion = with lib; concatStrings (intersperse "." (take 3 (splitString "." "${version}.0")));
    };
  }).overrideDerivation (_: {
    src = builtins.fetchTarball {
      url = "https://github.com/raspberrypi/linux/archive/fc5826fb999e0b32900d1f487e90c27a92010214.tar.gz";
    };
  });

  raspberrypifw = super.raspberrypifw.overrideAttrs (_: {
    src = builtins.fetchTarball {
      url = "https://github.com/raspberrypi/firmware/archive/b42496fd290dbe8cea47b230eb1782641329a24d.tar.gz";
    };
  });
}
