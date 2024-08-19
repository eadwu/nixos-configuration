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
        version = "2024.8.1805";
        sha256 = "19lkl0z3kajs1nhw6aw9g2w4ff4jmbnx99qlpy7a9ll1g8f0lzib";
      }

      {
        name = "vsc-material-theme";
        publisher = "equinusocio";
        version = "34.5.2";
        sha256 = "1vfmdkjs93b2pg7i0am70c2mgmiyrb4n8hn36nxf0xcwgdd0fl0w";
      }

      {
        name = "vsc-material-theme-icons";
        publisher = "equinusocio";
        version = "3.8.7";
        sha256 = "0a5fq5s53m9qbp711y1lv3f9fm3kgqb9wlnx4chb2i521a9afbpi";
      }

      {
        name = "copilot";
        publisher = "github";
        version = "1.223.1056";
        sha256 = "1j15bmvazlydz62pjw3h4qy7c16icalsfzhmr566rpqw89jq3h9c";
      }

      {
        name = "vscode-pull-request-github";
        publisher = "github";
        version = "0.95.2024081504";
        sha256 = "1c46ayw1263rvdxzh7siw40nyjpggmhyl30i9wz8pyy76yb656k3";
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
        version = "0.3.3";
        sha256 = "1rhb845l32r9ncwxynngq1zji2lf487ryc54n8hw8y9hph95pw7y";
      }

      {
        name = "magit";
        publisher = "kahole";
        version = "0.6.61";
        sha256 = "10zayxkrmajk12qajggixv0ssrjlmwr1s58d3mz2wb93kb1gmmdn";
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
        version = "0.381.0";
        sha256 = "0ckky1s1ppw8abn7h9crd6h3qfr5vhdgp0z2zdqis16h86jcnq58";
      }

      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.114.2024081215";
        sha256 = "1y2rbw5yqyai7hr8b241x0a7hsmr3fr1q0icy1lb9nk6jm821nb7";
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
        version = "1.0.5936";
        sha256 = "0l5r93zx6q1srfjz7y29xcsgjfx8z4hsd1bwa02ysgdxk2iwldpf";
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
        version = "24.6.0";
        sha256 = "04jhyfyfgmyfa6kywyrc0g4ns7qs45ivr5dmnj725ghr03w8ab2p";
      }
    ];
  };
}
