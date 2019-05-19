{ config, pkgs, lib, ... }:

let
  generateConfig = cfg: let
    literalBool = v: if v then "true" else "false";
  in ''
    [General]
    Background=${config.nixos.settings.xserver.background}
    ScaleImageCropped=${literalBool cfg.scaleImageCropped}
    ScreenWidth=${toString config.nixos.settings.machine.screen.width}
    ScreenHeight=${toString config.nixos.settings.machine.screen.height}

    # [Design Customizations]
    ThemeColor=${cfg.design.themeColor}
    AccentColor=${cfg.design.accentColor}
    RoundCorners=${toString cfg.design.roundCorners}
    ScreenPadding=${toString cfg.design.screenPadding}
    Font=${cfg.design.font}
    FontSize=${lib.optionalString (cfg.design.fontSize != null) cfg.design.fontSize}

    # [Locale Settings]
    Locale=${lib.optionalString (cfg.locale.name != null) cfg.locale.name}
    HourFormat=${lib.optionalString (cfg.locale.hourFormat != null) cfg.locale.hourFormat}
    DateFormat=${lib.optionalString (cfg.locale.dateFormat != null) cfg.locale.dateFormat}

    # [Interface Behavior]
    ForceRightToLeft=${literalBool cfg.interface.forceRightToLeft}
    ForceLastUser=${literalBool cfg.interface.forceLastUser}
    ForcePasswordFocus=${literalBool cfg.interface.forcePasswordFocus}
    ForceHideCompletePassword=${literalBool cfg.interface.forceHideCompletePassword}

    # [Translations]
    HeaderText=${cfg.translation.headerText}
    TranslateUsernamePlaceholder=
    TranslatePasswordPlaceholder=
    TranslateShowPassword=
    TranslateLoginFailed=
    TranslateLogin=
    TranslateSession=
    TranslateSuspend=
    TranslateReboot=
    TranslateShutdown=

    ${cfg.extraConfig}
  '';

  sugarConfig = pkgs.writeText "theme.conf"
    (generateConfig config.services.xserver.displayManager.sddm.greeters.sugar-dark);

  sddm-sugar-dark = pkgs.stdenv.mkDerivation {
    inherit (pkgs.sddm-sugar-dark) pname version buildInputs;

    buildCommand = ''
      cp -r ${pkgs.sddm-sugar-dark} $out
      chmod -R +w $out/share/sddm/themes/sugar-dark
      cp -f ${sugarConfig} $out/share/sddm/themes/sugar-dark/theme.conf
    '';
  };
in {
  imports =
    [
      ../../../../options/sddm-sugar-dark.nix
    ];

  environment.systemPackages = (lib.singleton sddm-sugar-dark) ++ (with pkgs.qt5; [
    qtbase
    qtquickcontrols2
  ]);
}
