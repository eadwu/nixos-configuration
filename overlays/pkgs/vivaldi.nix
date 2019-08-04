self: super:

with self.pkgs;

let
  versionAttrPath = [ "rss" "channel" "item" "enclosure" "sparkle:version" ];
  vivaldiVersion = runCommand "vivaldi-version" {
    src = builtins.fetchurl {
      url = "https://update.vivaldi.com/update/1.0/win/appcast.xml";
    };
    buildInputs = [ haskellPackages.xml-to-json ];
  } ''
    xml-to-json $src > $out
  '';
in {
  vivaldi = (super.vivaldi.override {
    isSnapshot = true;
    enableWidevine = true;
    proprietaryCodecs = true;
  }).overrideAttrs (_: rec {
    version = lib.getAttrFromPath versionAttrPath (builtins.fromJSON (builtins.readFile "${vivaldiVersion}"));

    src = builtins.fetchurl {
      url = "https://downloads.vivaldi.com/snapshot/vivaldi-snapshot_${version}-1_amd64.deb";
    };
  });
}
