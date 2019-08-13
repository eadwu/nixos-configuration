self: super:

with self.pkgs; {
  linux_rpi_4_19 = super.linux_rpi.override {
    argsOverride = rec {
      version = "4.19.58";
      modDirVersion = with lib; concatStrings (intersperse "." (take 3 (splitString "." "${version}.0")));

      src = builtins.fetchTarball {
        url = "https://github.com/raspberrypi/linux/archive/raspberrypi-kernel_1.20190718-1.tar.gz";
      };
    };
  };

  raspberrypifw = super.raspberrypifw.overrideAttrs (_: {
    src = builtins.fetchTarball {
      url = "https://github.com/raspberrypi/firmware/archive/1.20190718.tar.gz";
    };
  });
}
