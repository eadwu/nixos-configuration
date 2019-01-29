{ config, pkgs, lib, ... }:

let
  generateConfig = cfg: let
    literalBool = v: if v then "true" else "false";
  in ''
    [General]
    background=${cfg.background}

    ScreenWidth=${toString cfg.screen.width}
    ScreenHeight=${toString cfg.screen.height}

    blur=${literalBool cfg.blur.enable}
    recursiveBlurLoops=${toString cfg.blur.loops}
    recursiveBlurRadius=${toString cfg.blur.radius}

    PasswordFieldOutlined=${literalBool cfg.passwordFieldOutlined}

    PowerIconSize=${lib.optionalString (cfg.powerIconSize != null) (toString cfg.powerIconSize)}
    FontPointSize=${lib.optionalString (cfg.fontPointSize != null) (toString cfg.fontPointSize)}
    AvatarPixelSize=${lib.optionalString (cfg.avatarPixelSize != null) (toString cfg.avatarPixelSize)}

    translationReboot=${lib.optionalString (cfg.translation.reboot != null) cfg.translation.reboot}
    translationSuspend=${lib.optionalString (cfg.translation.suspend != null) cfg.translation.suspend}
    translationPowerOff=${lib.optionalString (cfg.translation.poweroff != null) cfg.translation.poweroff}

    ${cfg.extraConfig}
  '';

  chiliConfig = pkgs.writeText "theme.conf"
    (generateConfig config.services.xserver.displayManager.sddm.greeters.chili);

  sddm-chili = pkgs.stdenv.mkDerivation {
    pname = "sddm-chili";
    inherit (pkgs.sddm-chili) version buildInputs;

    buildCommand = ''
      cp -r ${pkgs.sddm-chili} $out
      chmod -R +w $out/share/sddm/themes/chili
      cp -f ${chiliConfig} $out/share/sddm/themes/chili/theme.conf
    '';
  };
in {
  imports =
    [
      ../../../options/sddm-chili.nix
    ];

  environment.systemPackages = (lib.singleton sddm-chili) ++ (with pkgs.qt5; [
    qtbase
    qtquickcontrols
    qtgraphicaleffects
  ]);
}
