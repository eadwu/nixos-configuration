self: super:

let
  python = super.python3.override {
    packageOverrides = old: _: with old; with self.pkgs; {
      spotdl = buildPythonPackage rec {
        pname = "spotdl";
        version = "1.2.2";

        src = fetchPypi {
          inherit pname version;
          sha256 = "002cv7ihf1z4r77gq1bc5cafcydyf9fx7a40hsnsmcwrzm94vqnz";
        };

        postPatch = ''
          # Incorporated into the std library since Python 3.4
          sed -i 's/"pathlib >= 1.0.1",//' setup.py
        '';

        propagatedBuildInputs = [
          pafy pyyaml appdirs logzero mutagen spotipy titlecase
          lyricwikia youtube-dl beautifulsoup4 unicode-slugify
        ];
      };

      lyricwikia = buildPythonPackage rec {
        pname = "lyricwikia";
        version = "0.1.9";

        src = fetchFromGitHub {
          owner = "enricobacis";
          repo = pname;
          rev = version;
          sha256 = "1dggrfdhyv2ypi2srkxn1xyl5w0l1bq5kph76k8ym7l5273k3fq4";
        };

        propagatedBuildInputs = [
          six requests pytestrunner beautifulsoup4
        ];

        doCheck = false;

        checkInputs = [
          pytest responses
        ];
      };

      unicode-slugify = buildPythonPackage rec {
        pname = "unicode-slugify";
        version = "0.1.3";

        src = fetchPypi {
          inherit pname version;
          sha256 = "0l7nphfdq9rgiczbl8n3mra9gx7pxap0xz540pkyz034zbz3mkrl";
        };

        propagatedBuildInputs = [
          six unidecode
        ];

        checkInputs = [
          nose
        ];
      };
    };
  };
in with python.pkgs; {
  python3s = python;
  spotdl = toPythonApplication spotdl;
}
