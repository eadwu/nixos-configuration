self: super:

with self.pkgs; {
  linux_rpi_4_19 = super.linux_rpi.override {
    argsOverride = rec {
      version = "4.19.65";
      modDirVersion = with lib; concatStrings (intersperse "." (take 3 (splitString "." "${version}.0")));

      src = builtins.fetchTarball {
        url = "https://github.com/raspberrypi/linux/archive/ea2c11a187c0e248343452846457b94715e04969.tar.gz";
      };
    };
  };

  raspberrypifw = super.raspberrypifw.overrideAttrs (_: {
    src = builtins.fetchTarball {
      url = "https://github.com/raspberrypi/firmware/archive/66bafab005569e3eb92ec54cd3efeee3da338738.tar.gz";
    };
  });
}
