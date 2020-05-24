{
  network.description = "Dockerized Pi-Hole";

  pipihole = import ../../containers/pihole;

  defaults = { ... }: {
    imports = [ ../machines/libvirtd.nix ];

    deployment.libvirtd = {
      memorySize = 512;
      baseImageSize = 4;
    };
  };
}
