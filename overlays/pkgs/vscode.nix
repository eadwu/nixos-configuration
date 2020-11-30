final: prev:

with final.pkgs; {
  vscode-insiders-with-extensions = prev.vscode-insiders-with-extensions.override {
    vscodeExtensions = with vscode-extensions; [
      ms-python.python
      ms-vscode.cpptools
      WakaTime.vscode-wakatime
    ] ++ vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vsc-material-theme";
        publisher = "Equinusocio";
        version = "33.0.0";
        sha256 = "1r8g9jm34xp7lld9mwv3sja1913aan0khxqrp7az89szwpnv73vg";
      }

      {
        name = "todo-tree";
        publisher = "Gruntfuggly";
        version = "0.0.188";
        sha256 = "1qwbkia0kby6vz2i8dw7ga29axfa6h8d3k2ljsqryqpi1lxlhrmx";
      }

      {
        name = "r";
        publisher = "Ikuyadeu";
        version = "1.6.1";
        sha256 = "0230wzskws3xaiq2b9la3pksrjjndq8a3dl07d2wp8hljsyiaqga";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "8.14.0";
        sha256 = "12bh2gpmak7vgzhjnvk2hw0yqm6wkd7vsm4ki4zbqa6lpriscjyi";
      }

      {
        name = "r-lsp";
        publisher = "REditorSupport";
        version = "0.1.11";
        sha256 = "0xkccl82zm9qsysi0rv4k0jcn8y20iqjdlivkm5a1a0w4xjjhqf0";
      }

      {
        name = "explorer-exclude-vscode-extension";
        publisher = "RedVanWorkshop";
        version = "1.2.0";
        sha256 = "02cfkyk0b7giasc9l08a1cj51spvcqc9qmndc48k1yanm4xhzxf9";
      }

      {
        name = "better-comments";
        publisher = "aaron-bond";
        version = "2.1.0";
        sha256 = "0kmmk6bpsdrvbb7dqf0d3annpg41n9g6ljzc1dh0akjzpbchdcwp";
      }

      {
        name = "Bookmarks";
        publisher = "alefragnani";
        version = "12.0.0";
        sha256 = "0jn5pfplnmnypd4gy3c5gqkmsqxza2vb6qn4ivf6ipmybpdb6rcb";
      }

      {
        name = "vscode-sqlite";
        publisher = "alexcvzz";
        version = "0.10.1";
        sha256 = "07z71kk0hpnr4696vl595ykjnfwznzix4lrnnl8027ydgzxg1lrl";
      }

      {
        name = "Nix";
        publisher = "bbenoist";
        version = "1.0.1";
        sha256 = "0zd0n9f5z1f0ckzfjr38xw2zzmcxg1gjrava7yahg5cvdcw6l35b";
      }

      {
        name = "solargraph";
        publisher = "castwide";
        version = "0.21.1";
        sha256 = "15dy6pg4cm0marj5wf5swqk60vmm0xbz284r26jhyn2jai8ccb33";
      }

      {
        name = "path-intellisense";
        publisher = "christian-kohler";
        version = "2.3.0";
        sha256 = "1wyp3k4gci1i64nrry12il6yflhki18gq2498z3nlsx4yi36jb3l";
      }

      {
        name = "vscode-eslint";
        publisher = "dbaeumer";
        version = "2.1.13";
        sha256 = "1adzgisljlq6xmmwrziawkgy941bf8i8nq4c9w3gnsbr20gd9pyi";
      }

      {
        name = "githistory";
        publisher = "donjayamanne";
        version = "0.6.14";
        sha256 = "11x116hzqnhgbryp2kqpki1z5mlnwxb0ly9r1513m5vgbisrsn0i";
      }

      {
        name = "gitlens";
        publisher = "eamodio";
        version = "11.0.6";
        sha256 = "0qlaq7hn3m73rx9bmbzz3rc7khg0kw948z2j4rd8gdmmryy217yw";
      }

      {
        name = "tslint";
        publisher = "eg2";
        version = "1.0.44";
        sha256 = "11q8kmm7k3pllwgflsjn20d1w58x3r0vl3i2b32bnbk2gzwcjmib";
      }

      {
        name = "vsc-material-theme-icons";
        publisher = "equinusocio";
        version = "1.2.0";
        sha256 = "0wh295ncm8cbxmw9i3pvg703sn1gw7vp3slbklwjxskb4zivvfk4";
      }

      {
        name = "auto-rename-tag";
        publisher = "formulahendry";
        version = "0.1.5";
        sha256 = "1ic3nxpcan8wwwzwm099plkn7fdy0zz2575rh4znc4sqgcqywh2i";
      }

      {
        name = "haskell";
        publisher = "haskell";
        version = "1.2.0";
        sha256 = "0vxsn4s27n1aqp5pp4cipv804c9cwd7d9677chxl0v18j8bf7zly";
      }

      {
        name = "lean";
        publisher = "jroesch";
        version = "0.16.16";
        sha256 = "06b08yyhmzq84fq83vri1hiphjdkg3hqv1qxdma7v6qfnhsrfi02";
      }

      {
        name = "language-haskell";
        publisher = "justusadam";
        version = "3.3.0";
        sha256 = "1285bs89d7hqn8h8jyxww7712070zw2ccrgy6aswd39arscniffs";
      }

      {
        name = "mips";
        publisher = "kdarkhan";
        version = "0.0.6";
        sha256 = "0bd1nl24aja2hky415y2mkn18kalyr9id7kyhypgqfwpsrvcdgpk";
      }

      {
        name = "noctis";
        publisher = "liviuschera";
        version = "10.39.1";
        sha256 = "0950h2yx2iv177g0b5dfk6ql66r7axh9apydqx7iglcaziql6k82";
      }

      {
        name = "rust-analyzer";
        publisher = "matklad";
        version = "0.2.392";
        sha256 = "0j9kimrvz5i3zwb34lhwjdiydxkivch3vc6j94bcdfavx35z4fsy";
      }

      {
        name = "vscode-language-babel";
        publisher = "mgmcdermott";
        version = "0.0.30";
        sha256 = "01aqk4xlmyvwgal8ya1dv4p88knwi7k6dwrnlq1rb4akr4fn1mfv";
      }

      {
        name = "git-graph";
        publisher = "mhutchie";
        version = "1.27.0";
        sha256 = "06w330k1lb6r03kvfsvcihxp7rh8v84czpcgx6fym1vwr7ab72wp";
      }

      {
        name = "vscode-clang";
        publisher = "mitaki28";
        version = "0.2.3";
        sha256 = "0xbg2frb4dxv7zl43gi25w2mkkh4xq2aidcf5i8b4imys9h720yr";
      }

      {
        name = "vscode-filesize";
        publisher = "mkxml";
        version = "2.1.4";
        sha256 = "0hk397iijr84f71ipv5b5n0dw9xmnhnzpzm3a06hflbavjfv5z2y";
      }

      {
        name = "vscode-docker";
        publisher = "ms-azuretools";
        version = "1.8.1";
        sha256 = "08691mwb3kgmk5fnjpw1g3a5i7qwalw1yrv2skm519wh62w6nmw8";
      }

      {
        name = "vscode-pylance";
        publisher = "ms-python";
        version = "2020.11.2";
        sha256 = "0n2dm21vgzir3hx1m3pmx7jq4zy3hdxfsandd2wv5da4fs9b5g50";
      }

      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2020.11.372831992";
        sha256 = "0r39xqrbkzcfkz6rca039s87ibx79a983y8lbiglhkmw3bp4p658";
      }

      {
        name = "azure-account";
        publisher = "ms-vscode";
        version = "0.9.4";
        sha256 = "0r687zkvq9ns00zs64rbq6qjg10izz9bf0yrkl2araw5gq6cgrgp";
      }

      {
        name = "hexeditor";
        publisher = "ms-vscode";
        version = "1.3.0";
        sha256 = "15zp4abnsd6z7vv81d6d2p9lfimj0qalv9zh9c5pki101yb7581s";
      }

      {
        name = "vs-keybindings";
        publisher = "ms-vscode";
        version = "0.2.0";
        sha256 = "176xvqcaf3ls5sa1ldb0iyv6hi5d6fmcam1a3gkdk6m5na6vfca8";
      }

      {
        name = "vsliveshare";
        publisher = "ms-vsliveshare";
        version = "1.0.3206";
        sha256 = "0x3m4z1w1697aw898pw08f374fhr1a0v2wq4sc84r7xy2nnax4yz";
      }

      {
        name = "debugger-for-chrome";
        publisher = "msjsdiag";
        version = "4.12.11";
        sha256 = "03krf4rfdyvb2i1qpzqygbcmqgjf00pcsc67wm2p31jk460d6bgn";
      }

      {
        name = "gremlins";
        publisher = "nhoizey";
        version = "0.26.0";
        sha256 = "1sfs98nxm5ylcjrmylr5y68ddml8cfg1q1wdm7wvhfhjqx4kig9h";
      }

      {
        name = "quicktype";
        publisher = "quicktype";
        version = "12.0.46";
        sha256 = "0mzn1favvrzqcigr74gmy167qak5saskhwcvhf7f00z7x0378dim";
      }

      {
        name = "ruby";
        publisher = "rebornix";
        version = "0.27.0";
        sha256 = "1y0fvciqxkj7nwvh4x25vrjfk1rym9h5fd38s89qfla36ac88fpr";
      }

      {
        name = "java";
        publisher = "redhat";
        version = "0.71.0";
        sha256 = "06p4vanniy14gn1f89za6w91dla54n0y5rk504dmx01ywfvqzxsk";
      }

      {
        name = "jinjahtml";
        publisher = "samuelcolvin";
        version = "0.15.0";
        sha256 = "18mjabpzldsaz5r1sp94kwk28chrmifcr4aql0fag6yh2kms1jas";
      }

      {
        name = "scala";
        publisher = "scala-lang";
        version = "0.4.5";
        sha256 = "0nrj32a7a86vwc9gfh748xs3mmfwbc304dp7nks61f0lx8b4wzxw";
      }

      {
        name = "shader";
        publisher = "slevesque";
        version = "1.1.4";
        sha256 = "0m5ld6l5sizqbj2k6754n2hn50ygajy464qz66dar2n3nhvjdv9n";
      }

      {
        name = "vscode-stylelint";
        publisher = "stylelint";
        version = "0.85.0";
        sha256 = "14nb3rr128kl7n1c70bbmi1v127dlj64qi37qz300fkdzgpl88mn";
      }

      {
        name = "cmake";
        publisher = "twxs";
        version = "0.0.17";
        sha256 = "11hzjd0gxkq37689rrr2aszxng5l9fwpgs9nnglq3zhfa1msyn08";
      }

      {
        name = "errorlens";
        publisher = "usernamehw";
        version = "3.2.4";
        sha256 = "0caxmf6v0s5kgp6cp3j1kk7slhspjv5kzhn4sq3miyl5jkrn95kx";
      }

      {
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.29.0";
        sha256 = "117z57fyl2ak6c71hrdh3xp9zsw2l4m90qw050n83an04lkxpqy4";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.11.0";
        sha256 = "15iqkfh8l6f6dpl0sk96nx7p20zdrky8zc129z8g0zcpx67ilzfp";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.26.0";
        sha256 = "17kwva4z3504ss3cpkkiim0mk9lk3n98i1cr52d43840flxzc4cy";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.26.0";
        sha256 = "1vqsrmy2jdq5zn4gjv4iwhc0jq0x7ba84fp464ki1m0dc3nchsyw";
      }
    ];
  };
}
