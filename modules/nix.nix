{ flakes, pkgs, ... }:

{
  nix.package = pkgs.nixVersions.stable;

  nix.extraOptions = ''
    show-trace = true
    experimental-features = flakes nix-command ca-derivations
  '';

  nix.nixPath = [ "nixpkgs=${flakes.nixpkgs.path}" ];

  nix.settings =
    {
      sandbox = true;
      trusted-users = [ "root" ];
      require-sigs = true;
      cores = 0;
      auto-optimise-store = true;
      allowed-users = [ "@wheel" ];
    };

  nixpkgs.config.allowUnfree = true;
  # Fully content-addressed system by default.
  # nixpkgs.config.contentAddressedByDefault = true;
  # Ensures no aliases.  Essentially attempt to keep up with the times.
  nixpkgs.config.allowAliases = false;
}
