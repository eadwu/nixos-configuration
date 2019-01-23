{ ... }:

{
  imports =
    [
      ../polyfill.nix
    ];

  hardware.nvidia = {
    modesetting.enable = true;

    optimus_prime = {
      enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  services.xserver.videoDrivers = [
    "nvidiaBeta"
  ];
}
