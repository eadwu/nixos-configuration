{ pkgs, lib, ... }:

{
  systemd.user.services.pipewire-media-session.wantedBy = [ "default.target" ];

  sound.enable = true;
  security.rtkit.enable = true;

  boot.kernelModules = [ "snd_seq" "snd_seq_midi" "snd_rawmidi" ] # ALSA Sequencer kernel modules
    ++ [ "snd_pcm_oss" "snd_mixer_oss" "snd_seq_oss" ];

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
    pulse.enable = true;
  };

  services.pipewire.config.pipewire = {
    "context.properties" = {
      ## Configure properties in the system.
      "link.max-buffers" = 64; # version < 3 clients can't handle more than 16
      "clock.power-of-two-quantum" = true;

      ## Properties for the DSP configuration.
      "default.clock.rate" = 96000;
    };
  };

  services.pipewire.media-session.config.bluez-monitor = {
    properties = {
      "bluez5.enable-msbc" = true;
      "bluez5.enable-sbc-xq" = true;
      "bluez5.enable-hw-volume" = true;

      # Enabled A2DP codecs
      "bluez5.codecs" = [ "aac" "sbc_xq" "sbc" ];

      # Properties for the A2DP codec configuration
      "bluez5.default.rate" = 96000;
      "bluez5.default.channels" = 2;
    };

    rules = [
      {
        matches = [ { "device.name" = "~bluez_card.*"; } ];
        actions.update-props = {
          # LDAC encoding quality
          # Available values: auto (Adaptive Bitrate, default)
          #                   hq   (High Quality, 990/909kbps)
          #                   sq   (Standard Quality, 660/606kbps)
          #                   mq   (Mobile use Quality, 330/303kbps)
          "bluez5.a2dp.ldac.quality" = "hq";
          # AAC variable bitrate mode
          # Available values: 0 (cbr, default), 1-5 (quality level)
          "bluez5.a2dp.aac.bitratemode" = 5;
          # A2DP <-> HFP profile auto-switching (when device is default output)
          # Available values: false, role (default), true
          # 'role' will switch the profile if the recording application
          # specifies Communication (or "phone" in PA) as the stream role.
          "bluez5.autoswitch-profile" = "role";
        };
      }
    ];
  };

  environment.systemPackages = with pkgs; [ pavucontrol pulsemixer pulseaudio ] # for pactl usage and finer output control
    ++ [ carla ] # JACK utilities
    ++ [ lsp-plugins dragonfly-reverb ladspa-bs2b rnnoise-plugin ] # Audio plugins
    ++ [ distrho swh_lv2 calf ir.lv2 ]
  ;

  environment.variables =
    (with lib;
    listToAttrs (
      map
        (
          type: nameValuePair "${toUpper type}_PATH"
            ([ "$HOME/.${type}" "$HOME/.nix-profile/lib/${type}" "/run/current-system/sw/lib/${type}" ])
        )
        [ "dssi" "ladspa" "lv2" "lxvst" "vst" "vst3" ]
    ));
}
