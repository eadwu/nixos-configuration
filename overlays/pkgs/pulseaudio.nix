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
    version = "unstable-2019-05-20";

    src = fetchFromGitHub {
      owner = "EHfive";
      repo = "pulseaudio-modules-bt";
      rev = "2fde9b79449661afd162f5d6eeeba49f80eba37a";
      sha256 = "1anzwg90n1kv4r28zf0j282yybxqd860d0fg07jmigq15wkszlbd";
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
