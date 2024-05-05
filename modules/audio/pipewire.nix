{ pkgs, lib, ... }:

{
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

    # Use wireplumber as the session manager
    wireplumber.enable = true;
  };

  # environment.etc."pipewire/pipewire.conf.d/99-pipewire.conf".text = builtins.toJSON {
  #   "context.properties" = {
  #     ## Configure properties in the system.
  #     "link.max-buffers" = 64; # version < 3 clients can't handle more than 16
  #     "clock.power-of-two-quantum" = true;

  #     ## Properties for the DSP configuration.
  #     # "default.clock.rate" = 96000;
  #   };
  # };

  environment.systemPackages = with pkgs; [ pavucontrol pulsemixer pulseaudio ] # for pactl usage and finer output control
    ++ [ carla ] # JACK utilities
    ++ [ lsp-plugins dragonfly-reverb ladspa-bs2b rnnoise-plugin ] # Audio plugins
 #   ++ [ distrho swh_lv2 calf ir.lv2 ]
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
