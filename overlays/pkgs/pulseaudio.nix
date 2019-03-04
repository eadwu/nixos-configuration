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
    version = "unstable-2019-02-28";

    src = fetchFromGitHub {
      owner = "EHfive";
      repo = "pulseaudio-modules-bt";
      rev = "ade461fbb01416d543fb27611319dd11dba7ef95";
      sha256 = "0h8clilkpj7j26m0ng0c3x4g0bfmhwmszxj0xq45i6bw4n8yzj7f";
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
