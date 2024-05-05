{ options, config, flakes, pkgs, lib, modulesPath, ... }:

{
  environment.variables.GALLIUM_DRIVER = "d3d12";
  # environment.variables.MESA_LOADER_DRIVER_OVERRIDE = "d3d12";
  # environment.variables.VDPAU_DRIVER = "d3d12";
  environment.variables.LIBVA_DRIVER_NAME = "d3d12";

  # environment.variables.PIPEWIRE_LATENCY = "2048/48000";

  environment.systemPackages = with pkgs; [
    socat
    
    xclip wl-clipboard 

    libglvnd
    libva-utils
    vdpauinfo
    vulkan-tools

    vulkan-loader
  ];

  # networking.firewall.allowedTCPPorts = [ 18181 ];
  # networking.firewall.allowedUDPPorts = [ 18181 ];

  # hardware.opengl.extraPackages = with pkgs; [
  #   vaapiIntel 
  #   intel-media-driver 
  #   intel-compute-runtime 
  # ];

  /*
  hardware.opengl.package =
    let
      directx-headers =
        with pkgs;
        stdenv.mkDerivation rec {
          pname = "DirectX-Headers";
          version = flakes.DirectX-Headers.version;

          src = flakes.DirectX-Headers.path;

          nativeBuildInputs = [ meson ninja ];

          mesonFlags = [ "-Dbuild-test=false" ];
        };
    in
    lib.mkOverride 999
      ((pkgs.mesa.override {
        enableGalliumNine = false;
        galliumDrivers = [ 
          "swrast" "d3d12" "zink"
          # "kmsro" "v3d" "vc4" "etnaviv" "panfrost" "lima" "freedreno"
        ];
        vulkanDrivers = [ 
          # "swrast" "microsoft-experimental" 
          # "swrast"
        ];
      }).overrideAttrs (oldAttrs: rec {
        buildInputs = (oldAttrs.buildInputs or [ ]) ++ [ 
          directx-headers 
          # pkgs.glslang 
        ];

        mesonFlags = (
          builtins.filter (str: (builtins.match ''.*xvmc.*'' str == null))
            (oldAttrs.mesonFlags or [ ])
        ) ++ [
          "-Dgallium-va=true"
          "-Dgallium-d3d12-video=enabled"
          "-Dgallium-va=enabled"
          "-Dgallium-vdpau=enabled" 
          "-Dvideo-codecs=vc1dec,h264dec,h264enc,h265dec,h265enc"
        ];

        #patches = [
        #  "${pkgs.path}/pkgs/development/libraries/mesa/opencl.patch"
        #  ../../configurations/disk_cache-include-dri-driver-path-in-cache-key.patch
        #];
      })).drivers;
  */

  fonts.fontconfig.enable = lib.mkOverride 0 true;
  fonts.fonts = with pkgs;
    [
      anonymousPro
      eb-garamond
      cascadia-code
      comfortaa
      corefonts
      font-awesome_5
      ibm-plex
      lato
      liberation_ttf
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      recursive
      unifont
      weather-icons
    ];

  programs.dconf.enable = true;
}
