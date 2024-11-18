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
        version = "2024.11.1604";
        sha256 = "1aqslirs0zxwj7b451blpvijxsx9bhvs6v87ic639rzj41bih0ai";
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
        version = "3.8.10";
        sha256 = "1vb41bc6s8yrn147dv8pr7zyv0nlwipnyvwcjjpniywil70ybrx3";
      }

      {
        name = "copilot";
        publisher = "github";
        version = "1.245.1215";
        sha256 = "0liamfhi9dr2d7ra2ajxsjg950h97jpli0y1fnbkl19ignlr6xzi";
      }

      {
        name = "vscode-pull-request-github";
        publisher = "github";
        version = "0.101.2024111804";
        sha256 = "10iqj4scbwhailh43p2p8h5mjx2w0m6z7ldc09pd90jlz44343nr";
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
        version = "3.2.2";
        sha256 = "060rcckwkwrxvs5z3ikx20a4ahx286si3yz2l5wmwqzkvw560n25";
      }

      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.391.0";
        sha256 = "1rw3k3slk7c815kbjbnbjdwgrskkhcjrqbdgyja8bydws10bxjcp";
      }

      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.116.2024111315";
        sha256 = "10b4b7wnvmgzwj5r72yzm75jn3fl7r2qn8dwy1sc3v6600a72xvr";
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
