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
    version = "unstable-2019-05-07";

    src = fetchFromGitHub {
      owner = "EHfive";
      repo = "pulseaudio-modules-bt";
      rev = "65ffe335a419405ceef12742e72294e06d484491";
      sha256 = "0fdld07pcf1wz0qsic1w44mw5h9w5y6018lincvw06w0yxr9yaqs";
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
