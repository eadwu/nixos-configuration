self: super:

with self.pkgs; rec {
  linux_rpi_4_19 = (
    super.linux_rpi.override {
      argsOverride = rec {
        version = "4.19.75";
        modDirVersion = with lib; concatStrings (intersperse "." (take 3 (splitString "." "${version}.0")));
      };
    }
  ).overrideDerivation (
    oldAttrs: {
      src = builtins.fetchTarball {
        url = "https://github.com/raspberrypi/linux/archive/6d8bf28fa4b1ca0a35c0cd1dcb267fb216daf720.tar.gz";
      };

      nativeBuildInputs = (oldAttrs.nativeBuildInputs or []) ++ [
        flex
        bison
      ];
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
        url = "https://github.com/raspberrypi/firmware/archive/f5c626c64874d6e1482edf4a76aa22e5e54be63d.tar.gz";
      };
    }
  );
}
