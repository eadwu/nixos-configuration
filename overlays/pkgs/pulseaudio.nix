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
    version = "unstable-2019-04-12";

    src = fetchFromGitHub {
      owner = "EHfive";
      repo = "pulseaudio-modules-bt";
      rev = "9ff89b430c67e98eb3a74e0f06a8957449e21927";
      sha256 = "1sffm08mjizri2mx2rjpfwqgsbpy2b8v92nkvwl1s0j51dji6s6r";
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
