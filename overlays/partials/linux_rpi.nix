self: super:

with self.pkgs; rec {
  linux_rpi_4_19 = (
    super.linux_rpi.override {
      argsOverride = rec {
        version = "4.19.73";
        modDirVersion = with lib; concatStrings (intersperse "." (take 3 (splitString "." "${version}.0")));
      };
    }
  ).overrideDerivation (
    _: {
      src = builtins.fetchTarball {
        url = "https://github.com/raspberrypi/linux/archive/4d486c17f636bb339c10cd73a07292220a973e01.tar.gz";
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
        url = "https://github.com/raspberrypi/firmware/archive/f8e05108dbb3b5640f48b6b301296e979876836b.tar.gz";
      };
    }
  );
}
