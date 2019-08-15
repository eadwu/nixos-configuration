self: super:

with self.pkgs; {
  anime4k = stdenv.mkDerivation rec {
    pname = "anime4k";
    version = "0.9";

    src = fetchzip {
      url = "https://github.com/bloc97/Anime4K/releases/download/${version}/Anime4K_Java.zip";
      sha256 = "0r534z89361h4f1dq1h3rxqwqspjhq7a6d67m8ii34cdy7bxg15q";
      stripRoot = false;
    };

    nativeBuildInputs = [ makeWrapper ];

    dontBuild = true;

    installPhase = ''
      mkdir -p $out/lib
      cp -r lib/* $out/lib

      mkdir -p $out/libexec/anime4k
      cp Anime4K.jar $out/libexec/anime4k

      classpath=$out/libexec/anime4k/Anime4K.jar
      for jar in $out/lib/*.jar; do
        classpath="$classpath:$jar"
      done

      mkdir -p $out/bin
      makeWrapper ${openjdk12}/bin/java $out/bin/anime4k \
        --add-flags "-classpath $classpath com.bloc97.anime4k.Main" \
        --prefix LD_LIBRARY_PATH : "${ocl-icd}/lib"
    '';

    passthru.shaders = fetchzip {
      url = "https://github.com/bloc97/Anime4K/releases/download/${version}/Anime4K_GLSL.zip";
      sha256 = "0hbgbgcbhydpiflbg1x434237i9irck72lnq15zb28crlsdwbk3a";
    };
  };
}
