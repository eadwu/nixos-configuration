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

  services.pipewire.media-session.config.bluez-monitor = {
    properties = {
      "bluez5.msbc-support" = true;
      "bluez5.sbc-xq-support" = true;
      "bluez5.codecs" = [ "sbc_xq" "sbc" ];
    };

    rules = [
      {
        matches = [ { "device.name" = "~bluez_card.*"; } ];
        actions.update-props = {
          "bluez5.a2dp.ldac.quality" = "hq";
          "bluez5.a2dp.aac.bitratemode" = 5;
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
