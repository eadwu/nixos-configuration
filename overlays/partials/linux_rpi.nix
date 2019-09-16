self: super:

with self.pkgs; rec {
  linux_rpi_4_19 = (
    super.linux_rpi.override {
      argsOverride = rec {
        version = "4.19.67";
        modDirVersion = with lib; concatStrings (intersperse "." (take 3 (splitString "." "${version}.0")));
      };
    }
  ).overrideDerivation (
    _: {
      src = builtins.fetchTarball {
        url = "https://github.com/raspberrypi/linux/archive/174fcab91765ef8fe3562c9858fb62f1a471c2d6.tar.gz";
      };
    }
  );

  linux_rpi_4_19_hardened = linux_rpi_4_19.override {
    argsOverride.modDirVersion = linux_rpi_4_19.modDirVersion + "-hardened";
  };

  rpiPackages_4_19 = self.pkgs.linuxPackagesFor linux_rpi_4_19;
  rpiPackages_4_19_hardened = self.pkgs.hardenedLinuxPackagesFor linux_rpi_4_19_hardened;

  raspberrypifw = super.raspberrypifw.overrideAttrs (
    _: {
      src = builtins.fetchTarball {
        url = "https://github.com/raspberrypi/firmware/archive/7163480fff007dc98978899b556dcf06f8a462c8.tar.gz";
      };
    }
  );
}
