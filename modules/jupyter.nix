{ config, pkgs, ... }:

{
  services.jupyter = {
    enable = true;
    password = "'sha1:2dbd9701ebff:951b7987996e7fb05c664dc88d66b28f51bb30ba'";
    notebookDir = "~/Notebooks";
    kernels = {
      mth309 = let
        env = (pkgs.python3.withPackages (pythonPackages: with pythonPackages;
          [ ipykernel sympy requests ] ));
      in {
        displayName = "Python 3 for MTH309";
        argv = [
          "${env.interpreter}"
          "-m"
          "ipykernel_launcher"
          "-f"
          "{connection_file}"
        ];
        language = "python";
        logo32 = "${env}/${env.sitePackages}/ipykernel/resources/logo-32x32.png";
        logo64 = "${env}/${env.sitePackages}/ipykernel/resources/logo-64x64.png";
      };
    };
  };

  systemd.services.jupyter = {
    preStart = with config.services.jupyter; ''
      if [ ! -d ${notebookDir} ]; then
        mkdir -p ${notebookDir}
      fi
      chown ${user}:${group} ${notebookDir}
    '';

    serviceConfig.PermissionsStartOnly = true;
  };
}
