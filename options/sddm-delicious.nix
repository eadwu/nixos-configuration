{ config, pkgs, lib, ... }:

with lib;

let
  scfg = config.services.xserver.displayManager.sddm;
  cfg = scfg.greeters.delicious;

  deliciousConfig = let
    literalBool = v: if v then "enable" else "disable";
  in pkgs.writeText "theme.conf" ''
    [General]
    background=${cfg.background}

    fontfamily=${cfg.font.family}
    fontcolor=${cfg.font.color}
    fontscale=${cfg.font.scale}

    sessions=${concatStringsSep "," cfg.sessions}

    icontheme=${cfg.icon.theme}
    iconformat=${cfg.icon.format}
    iconoverlay=${cfg.icon.overlay}
    iconglow=${literalBool cfg.icon.glow}

    glowcolor=${cfg.glowColor}

    ${cfg.extraConfig}
  '';

  fontOpts = { ... }: {
    options = {
      family = mkOption {
        type = types.str;
        default = "Optician Sans";
        description = ''
          Font
        '';
      };

      color = mkOption {
        type = types.str;
        default = "#DD000000";
        description = ''
          Font color in #AARRBBGG or #RRGGBB format
        '';
      };

      scale = mkOption {
        type = types.str;
        default = "1.1";
        description = ''
          Multiplier for font size
        '';
      };
    };
  };

  iconOpts = { ... }: {
    options = {
      theme = mkOption {
        type = types.str;
        default = "delicate";
        description = ''
          Icon theme
        '';
      };

      format = mkOption {
        type = types.str;
        default = "svg";
        description = ''
          Format of your icons
        '';
      };

      overlay = mkOption {
        type = types.str;
        default = "#DD000000";
        description = ''
          Overlay color for icons
        '';
      };

      glow = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Glow around selected session and text
        '';
      };
    };
  };
in {
  options = {
    services.xserver.displayManager.sddm.greeters.delicious = {
      background = mkOption {
        type = types.path;
        default = "${pkgs.sddm-delicious}/background/space.mp4";
        description = ''
          Background image or video located in the background folder
        '';
      };

      font = mkOption {
        type = types.submodule fontOpts;
        default = {};
        description = ''
          Font configuration
        '';
      };

      sessions = mkOption {
        type = types.nonEmptyListOf types.str;
        default = [ "i3" "dwm" "bspwm" "gnome" "plasma" "awesome" "fluxbox" "windows" ];
        description = ''
          Available sessions with icons
        '';
      };

      icon = mkOption {
        type = types.submodule iconOpts;
        default = {};
        description = ''
          Icon configuration
        '';
      };

      glowColor = mkOption {
        type = types.str;
        default = "#FFFF0000";
        description = ''
          Color of glow
        '';
      };

      extraConfig = mkOption {
        type = types.lines;
        default = "";
        description = ''
        '';
      };
    };
  };

  config = mkIf (scfg.enable && scfg.theme == "delicious") {
    environment.systemPackages = singleton
      (pkgs.sddm-delicious.overrideAttrs (oldAttrs: {
        postInstall = (oldAttrs.postInstall or "") + ''
          cp -f ${deliciousConfig} $out/$installPrefix/$themeName/theme.conf
        '';
      }));
  };
}
