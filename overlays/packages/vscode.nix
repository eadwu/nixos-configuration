final: prev:

with final.pkgs; {
  vscode-insiders-with-extensions = prev.vscode-insiders-with-extensions.override {
    vscodeExtensions = vscode-utils.extensionsFromVscodeMarketplace [
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
        version = "2.9.0";
        sha256 = "1sshl8za6wviaikad8pisisn2x1y382npsh7grw3vdfi4j3awb8g";
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
        version = "2024.11.205";
        sha256 = "0j2dyzqiprpb1z3axb10p3sgpqd4gr91mrgh3napcgwz5wqczfjj";
      }

      {
        name = "vsc-material-theme";
        publisher = "equinusocio";
        version = "34.7.7";
        sha256 = "1pdsymimah3zxjw91x68pvbb965hvr3c1dxvq0fd2plgdymm9135";
      }

      {
        name = "vsc-material-theme-icons";
        publisher = "equinusocio";
        version = "3.8.8";
        sha256 = "1jdk3n5x7piahz17xcblfn1kywvwnpj7yzpnv1kr10dmm90s2pbs";
      }

      {
        name = "copilot";
        publisher = "github";
        version = "1.243.1193";
        sha256 = "1gcsd3rrnikvfwfnd2xwv0y09qkswwhgzdyaqpw33k0mfc7mi5qy";
      }

      {
        name = "vscode-pull-request-github";
        publisher = "github";
        version = "0.101.2024103104";
        sha256 = "01a0232yj0kclnkgh97l9vhqk64n07vg3ffm9xab0jlmis3cl91i";
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
        version = "0.6.62";
        sha256 = "09zzfdas4yaj6rrz9zzvx7859j7gb6fnk7ipy80nz7pwjzl8v3sl";
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
        version = "3.2.1";
        sha256 = "0zw816rhs18zicxzhqw97bnrns2cl00cvl6hxaf94kwzs57cjby7";
      }

      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.390.0";
        sha256 = "0b7w7g5dwfwl2c4am31v3dnv54094k8jw6vph5z816b376nf1d8h";
      }

      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.116.2024100715";
        sha256 = "15k5fxaqc8nzrnc09r197dfx5b9s1ni56kwlv2x1iv1nc027b39j";
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
        version = "1.0.5941";
        sha256 = "0qpbq4j2mz1cv10bn7kdipyjany7j5zw71p3djp2dz9a5i1pmcxk";
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
        version = "3.20.0";
        sha256 = "0gfjp17f54439hsg83v5x522qjp0bhbsjwy7b4f42zmbxvx9606j";
      }
    ];
  };
}
