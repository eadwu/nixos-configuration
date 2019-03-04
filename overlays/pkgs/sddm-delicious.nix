self: super:

with self.pkgs; {
  sddm-delicious = stdenv.mkDerivation rec {
    pname = "sddm-delicious";
    version = "unstable-2019-03-03";

    src = fetchFromGitHub {
      owner = "stuomas";
      repo = "delicious-sddm-theme";
      rev = "fc98a56db6a61521cb2c55f2c50416f01f565ef7";
      sha256 = "085n7663p0bz6jl516z7gvkc09m2rr33cygpl3n3fnyg3ins7msw";
    };

    postPatch = ''
      sed -i 's@"../background/" + \(config.background\)@\1@' src/logic.js
    '';

    dontBuild = true;

    installPhase = ''
      mkdir -p mkdir -p $out/share/sddm/themes
      cp -r . $out/share/sddm/themes/delicious
    '';
  };
}
