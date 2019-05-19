{ config, pkgs, lib, ... }:

let
  generateConfig = cfg: let
    literalBool = v: if v then "enable" else "disable";
  in ''
    [General]
    background=${cfg.background}

    fontfamily=${cfg.font.family}
    fontcolor=${cfg.font.color}
    fontscale=${cfg.font.scale}

    sessions="${lib.concatStringsSep "," cfg.sessions}"

    icontheme=${cfg.icon.theme}
    iconformat=${cfg.icon.format}
    iconoverlay=${cfg.icon.overlay}
    iconglow=${literalBool cfg.icon.glow}

    glowcolor=${cfg.glowColor}

    ${cfg.extraConfig}
  '';

  deliciousConfig = pkgs.writeText "theme.conf"
    (generateConfig config.services.xserver.displayManager.sddm.greeters.delicious);

  sddm-delicious = pkgs.stdenv.mkDerivation {
    pname = "sddm-delicious";
    inherit (pkgs.sddm-delicious) version buildInputs;

    buildCommand = ''
      cp -r ${pkgs.sddm-delicious} $out
      chmod -R +w $out/share/sddm/themes/delicious
      cp -f ${deliciousConfig} $out/share/sddm/themes/delicious/theme.conf
    '';
  };
in {
  imports =
    [
      ../../../../options/sddm-delicious.nix
    ];

  environment.systemPackages = (lib.singleton sddm-delicious) ++ (with pkgs.qt5; [
    qtbase
    qtmultimedia
    qtquickcontrols
    qtgraphicaleffects
  ]);

  services.xserver.displayManager.sddm.greeters.delicious = {
    sessions = lib.singleton "dwm";
  };
}
