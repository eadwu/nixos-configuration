final: prev:

let
  vscodeExtensions = final.pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "better-comments";
      publisher = "aaron-bond";
      version = "3.0.2";
      sha256 = "15w1ixvp6vn9ng6mmcmv9ch0ngx8m85i1yabxdfn6zx3ypq802c5";
    }

    {
      name = "bookmarks";
      publisher = "alefragnani";
      version = "13.5.0";
      sha256 = "06pmlmd3wahplhv5r8jdk19xlv2rmhiggmmw6s30pnys2bj5va50";
    }

    {
      name = "path-intellisense";
      publisher = "christian-kohler";
      version = "2.10.0";
      sha256 = "06x9ksl4bghfpxh4n65d1d7dr11spl140p9ch4mc01nrdibgckbc";
    }

    {
      name = "githistory";
      publisher = "donjayamanne";
      version = "0.6.20";
      sha256 = "0x9q7sh5l1frpvfss32ypxk03d73v9npnqxif4fjwcfwvx5mhiww";
    }

    {
      name = "gitlens";
      publisher = "eamodio";
      version = "2025.1.1104";
      sha256 = "065zz5fapxbx8ip0ngzfjwx97w0wi3crbghrfy522ccdh8nasnbc";
    }

    {
      name = "vsc-material-theme";
      publisher = "equinusocio";
      version = "34.7.9";
      sha256 = "0a2hjd552b2fbfkm3wcvf5rh6dl4wb9kdrmdji4yx9jvqh2di60z";
    }

    {
      name = "vsc-material-theme-icons";
      publisher = "equinusocio";
      version = "3.8.12";
      sha256 = "0srj5d5mkfpcz4sissk5gbs4ijjlr7hqfjwmqa6rxslrgjihdb5g";
    }

    {
      name = "copilot";
      publisher = "github";
      version = "1.256.1304";
      sha256 = "0pbmhqxxsbvxqcb9m7zki2n5vsgmrbknzija8c8417vn54dvadq6";
    }

    {
      name = "vscode-pull-request-github";
      publisher = "github";
      version = "0.103.2025010904";
      sha256 = "1zbqdv2lp1rxpmbsxf9v43a0nm9a1n62662dmy7wp8k9ajgcf7a8";
    }

    {
      name = "todo-tree";
      publisher = "gruntfuggly";
      version = "0.0.226";
      sha256 = "0yrc9qbdk7zznd823bqs1g6n2i5xrda0f9a7349kknj9wp1mqgqn";
    }

    {
      name = "nix-ide";
      publisher = "jnoortheen";
      version = "0.3.5";
      sha256 = "12sg67mn3c8mjayh9d6y8qaky00vrlnwwx58v1f1m4qrbdjqab46";
    }

    {
      name = "magit";
      publisher = "kahole";
      version = "0.6.64";
      sha256 = "1d69j6nqmdlm6dihvq1fa207r1ycqz5225l6b3bz5wfzmb50zfri";
    }

    {
      name = "noctis";
      publisher = "liviuschera";
      version = "10.43.3";
      sha256 = "0lkkrrcp97pcq2k8brb4bw1gi58bngjxpzk8c2mdhm3pa9dixij4";
    }

    {
      name = "git-graph";
      publisher = "mhutchie";
      version = "1.30.0";
      sha256 = "000zhgzijf3h6abhv4p3cz99ykj6489wfn81j0s691prr8q9lxxh";
    }

    {
      name = "vscode-filesize";
      publisher = "mkxml";
      version = "3.2.2";
      sha256 = "060rcckwkwrxvs5z3ikx20a4ahx286si3yz2l5wmwqzkvw560n25";
    }

    {
      name = "remote-containers";
      publisher = "ms-vscode-remote";
      version = "0.395.0";
      sha256 = "19m1n2k9bw0kms2adz9lngxbf2ymnf2571n663mwd9yxsjrrm2km";
    }

    {
      name = "remote-ssh";
      publisher = "ms-vscode-remote";
      version = "0.117.2025011020";
      sha256 = "12q3ljh1bpv9705agl60imcqifm9cq986vgs3yxn59gvn715fdxi";
    }

    {
      name = "hexeditor";
      publisher = "ms-vscode";
      version = "1.11.1";
      sha256 = "1dm3l23pwxr2bslwy6aik6lxfz101zna95vcrh2g7dglklx5h7j4";
    }

    {
      name = "vs-keybindings";
      publisher = "ms-vscode";
      version = "0.2.1";
      sha256 = "1h7dihd6f39jcp27haiwbjdsymyi5p2v4f101lxdi5fafz3y6win";
    }

    {
      name = "vsliveshare";
      publisher = "ms-vsliveshare";
      version = "1.0.5948";
      sha256 = "0rhwjar2c6bih1c5w4w8gdgpc6f18669gzycag5w9s35bv6bvsr8";
    }

    {
      name = "gremlins";
      publisher = "nhoizey";
      version = "0.26.0";
      sha256 = "1sfs98nxm5ylcjrmylr5y68ddml8cfg1q1wdm7wvhfhjqx4kig9h";
    }

    {
      name = "explorer-exclude";
      publisher = "peterschmalfeldt";
      version = "1.3.2";
      sha256 = "1khvs655dl0gn69azx1hzv9czli1kc7w18dfwirqkdibf1zxvg07";
    }

    {
      name = "errorlens";
      publisher = "usernamehw";
      version = "3.22.0";
      sha256 = "17bpn6f6clh9nm9jxfdyn50ib5q54wn3bgf2fjcj1iv0pqkb5vaj";
    }
  ];
in
{
  vscode-with-extensions = prev.vscode-with-extensions.override {
    inherit vscodeExtensions;
  };

  vscode-insiders-with-extensions = prev.vscode-insiders-with-extensions.override {
    inherit vscodeExtensions;
  };
}
