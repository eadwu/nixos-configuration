{ pkgs, ... }:

{
  hardware.pulseaudio = {
    enable = true;
    extraModules = [ pkgs.pulseaudio-modules-bt ];
    package = pkgs.pulseaudioFull;

    tcp = {
      enable = true;
      anonymousClients.allowedIpRanges = [ "127.0.0.1" ];
    };

    daemon.config = {
      # Audio Control
      flat-volumes = "no";

      # Priority
      high-priority = "yes";
      nice-level = -11;
      realtime-scheduling = "yes";
      realtime-priority = 9;
      rlimit-rtprio = 9;

      # Audio quality
      default-sample-channels = 6;
      default-sample-rate = 96000;
      alternate-sample-rate = 44100;

      default-sample-format = "float32le";
      resample-method = "speex-float-10";

      avoid-resampling = false;
      enable-lfe-remixing = "no";
    };

    extraConfig = ''
      ### Automatically switch to newly-connected devices
      load-module module-switch-on-connect

      ### WebRTC Noise Cancellation
      load-module module-echo-cancel aec_method="webrtc"

      ### A2DP/HFGW Switch
      .ifexists module-bluetooth-policy.so
      unload-module module-bluetooth-policy
      load-module module-bluetooth-policy auto_switch=2
      .endif

      ### oFono backend support
      .ifexists module-bluetooth-discover.so
      unload-module module-bluetooth-discover
      load-module module-bluetooth-discover headset="auto" a2dp_config="sbc_freq=48k ldac_eqmid=hq ldac_fmt=f32 aac_fmt=s32"
      .endif
    '';
  };
}
