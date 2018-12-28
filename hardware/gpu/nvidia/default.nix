{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      vdpauinfo
    ];
  };

  hardware = {
    opengl = {
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
  };

  services = {
    xserver = {
      useGlamor = true;
    };
  };
}
