self: super:

{
  clight = super.clight.overrideAttrs (oldAttrs: rec {
    version = "master";

    src = builtins.fetchGit {
      url = "https://github.com/FedeDP/Clight";
      ref = version;
    };
  });

  clightd = super.clightd.overrideAttrs (oldAttrs: rec {
    version = "master";

    src = builtins.fetchGit {
      url = "https://github.com/FedeDP/Clightd";
      ref = version;
    };
  });
}
