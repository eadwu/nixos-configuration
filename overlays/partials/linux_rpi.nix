self: super:

with self.pkgs; rec {
  linux_rpi3_4_19 = (
    super.linux_rpi3.override {
      argsOverride = rec {
        version = "4.19.75";
        modDirVersion = with lib; concatStrings (intersperse "." (take 3 (splitString "." "${version}.0")));
      };
    }
  ).overrideDerivation (
    oldAttrs: {
      src = fetchurl {
        url = "https://github.com/raspberrypi/linux/archive/6d8bf28fa4b1ca0a35c0cd1dcb267fb216daf720.tar.gz";
        sha256 = "0gc7vqy1ajwyh65xh569hsh23k82gh1zh5gpr0vhcid92vyh5ayc";
      };

      nativeBuildInputs = (oldAttrs.nativeBuildInputs or []) ++ [
        flex
        bison
      ];
    }
  );

  linux_rpi3_4_19_hardened = linux_rpi3_4_19.override {
    argsOverride.modDirVersion = linux_rpi3_4_19.modDirVersion + "-hardened";
  };

  rpi3Packages_4_19 = self.pkgs.linuxPackagesFor linux_rpi3_4_19;
  rpi3Packages_4_19_hardened = self.pkgs.hardenedLinuxPackagesFor linux_rpi3_4_19_hardened;

  raspberrypifw = super.raspberrypifw.overrideAttrs (
    _: {
      src = fetchurl {
        url = "https://github.com/raspberrypi/firmware/archive/f5c626c64874d6e1482edf4a76aa22e5e54be63d.tar.gz";
        sha256 = "1dhks6d4agy278akg8b6fq70mrzsnnf4xibpyzdzraf9lj2dg39q";
      };
    }
  );
}
