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
    version = "unstable-2019-03-09";

    src = fetchFromGitHub {
      owner = "EHfive";
      repo = "pulseaudio-modules-bt";
      rev = "c27dc5b88ced88d763550125346fa3e73b77b73a";
      sha256 = "1982i2ya67n79yj219x1l4n8k87x12dc5k717w7zyxzxryyj7d55";
      fetchSubmodules = true;
    };

    patches = [];

    postPatch = ''
      sed -i 's@ ''${PulseAudio_modlibexecdir})@ ${placeholder "out"}/lib/pulse-${pulseaudio.version}/modules/)@' CMakeLists.txt
    '';

    buildInputs = oldAttrs.buildInputs ++ [
      ldacbt
    ];
  });
}
