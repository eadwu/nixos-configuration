self: super:

with self.pkgs; {
  vivaldi = (super.vivaldi.override {
    isSnapshot = true;
  }).overrideAttrs (oldAttrs: rec {
    version = "2.5.1511.4-1";

    src = fetchurl {
      url = "https://downloads.vivaldi.com/snapshot/vivaldi-snapshot_${version}_amd64.deb";
      sha256 = "024171p021i1p0hhxk8r61mpjn5ivpnlk3z0ja3gz94q8ipvqxrn";
    };
  });
}
