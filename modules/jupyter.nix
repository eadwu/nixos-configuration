{ config, pkgs, ... }:

let
  packageOverrides = _: super: {
    pytorch = super.pytorch-bin;
  };

  python = pkgs.python3.override { inherit packageOverrides; };
in {
  services.jupyter = {
    enable = true;
    password = "'sha1:2dbd9701ebff:951b7987996e7fb05c664dc88d66b28f51bb30ba'";
    notebookDir = "~/Notebooks";
    kernels = let
      kernel = target: env: {
        displayName = "Python 3 for ${target}";
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
    in {
      fastai = kernel "fast.ai" (python.withPackages (pythonPackages: with pythonPackages;
        [ jupyter ipykernel
          fastai fastai2 pyarrow
          graphviz ipywidgets matplotlib nbdev pandas scikitlearn
            azure-cognitiveservices-search-imagesearch ] ));

      mth309 = kernel "MTH309" (python.withPackages (pythonPackages: with pythonPackages;
          [ jupyter ipykernel sympy requests matplotlib ] ));
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
