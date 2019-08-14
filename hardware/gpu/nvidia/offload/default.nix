{ pkgs, ... }:

let
  primerun = pkgs.writeShellScriptBin "primerun" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec -a "$0" "$@"
  '';
in {
  imports = [ ../. ];

  hardware.nvidia.prime.offload.enable = true;
  environment.systemPackages = [ primerun ];
}
