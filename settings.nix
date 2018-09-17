let
  user = "xps";
  dpiScale = "2";
  hostname = "nixos";
  # jp, nl, us
  protonRegion = "jp";

  DOCKER_ID_USER = "tianxian";
in {
  user = user;
  dpiScale = dpiScale;
  hostname = hostname;
  protonRegion = protonRegion;

  protonFile = "/etc/nixos/credentials/protonvpn";
  passwordFile = "/etc/nixos/credentials/${user}";

  HOME = "/home/${user}";
  DOCKER_ID_USER = DOCKER_ID_USER;
}
