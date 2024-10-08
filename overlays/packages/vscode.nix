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
        version = "2024.9.2905";
        sha256 = "0rjj522vacl7xksnfcqs8zhw8g479gyiirw5hhf5w01c9a461zyh";
      }

      {
        name = "vsc-material-theme";
        publisher = "equinusocio";
        version = "34.7.5";
        sha256 = "14sa5qz3v4cjn8mv7a2354i7zj447bxmn3y363k9md0khgmjp0z9";
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
        version = "1.234.1129";
        sha256 = "1gqg845ssbn3v50jzqi3cxb13zk6yfds5k6y8xbn2lmczc8hb0ai";
      }

      {
        name = "vscode-pull-request-github";
        publisher = "github";
        version = "0.97.2024092604";
        sha256 = "12h9k0dcgn5g7wm08929z4lqi4p54na1xdapl1vb7a584cx3h6nm";
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
        version = "3.1.0";
        sha256 = "1zxdsqr5h0xl6arphi5i1xfgby4cin39jxpnmdgcg41p6qr3k3z7";
      }

      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.387.0";
        sha256 = "1ibqqpqn3jdx5f52p0478620d9v2wizvdrkdjr98hsk7qdpvryxg";
      }

      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.115.2024092415";
        sha256 = "0c329ngi004k0lp63xgv202a1qxvjh3kcanvf36fq7gp0drnpn6n";
      }

      {
        name = "hexeditor";
        publisher = "ms-vscode";
        version = "1.10.0";
        sha256 = "0mlibryaxfilsl61asm9yxz3jz1jpvp8q3r9w0mg4mpa1ajjqd8h";
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

      {
        name = "vscode-wakatime";
        publisher = "wakatime";
        version = "24.6.2";
        sha256 = "1j18xb2i8gmlji18xk05z6ym7w3y7shb2gncm80swsjkxazixpi1";
      }
    ];
  };
}
