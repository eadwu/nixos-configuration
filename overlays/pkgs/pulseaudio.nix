self: super:

with self.pkgs; {
  ldacbt = stdenv.mkDerivation rec {
    pname = "ldacbt";
    version = "2.0.2.3";

    src = fetchFromGitHub {
      owner = "EHfive";
      repo = "ldacBT";
      rev = "v${version}";
      sha256 = "09dalysx4fgrgpfdm9a51x6slnf4iik1sqba4xjgabpvq91bnb63";
      fetchSubmodules = true;
    };

    nativeBuildInputs = [
      cmake
    ];
  };

  pulseaudio-modules-bt = super.pulseaudio-modules-bt.overrideAttrs (oldAttrs: rec {
    name = "${pname}-${version}";
    pname = stdenv.lib.removeSuffix "-${oldAttrs.version}" oldAttrs.name;
    version = "unstable-2019-02-15";

    src = builtins.fetchGit {
      url = "https://github.com/EHfive/pulseaudio-modules-bt";
      rev = "35283a796dd4a932cab6ca8e1eef79bf10935544";
    };

    buildInputs = oldAttrs.buildInputs ++ [
      ldacbt
    ];
  });
}
