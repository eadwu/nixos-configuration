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
        version = "33.1.2";
        sha256 = "14db0xmhcrk0lxafcgiqqzi1ydhiy16hs4r9g0jcdglj8bn6y624";
      }

      {
        name = "todo-tree";
        publisher = "Gruntfuggly";
        version = "0.0.192";
        sha256 = "00spvv6kkz3pylwdy6l00d19h1fraigszxrszqfyw1y4bq212gmz";
      }

      {
        name = "r";
        publisher = "Ikuyadeu";
        version = "1.6.2";
        sha256 = "1cvh2qb2jvp4nbf789isf5n4gn2v7qgvvgim3azlawjlwas7b76b";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "8.15.0";
        sha256 = "0v4pq3l6g4dr1qvnmgsw148061lngwmk3zm12q0kggx85blki12d";
      }

      {
        name = "r-lsp";
        publisher = "REditorSupport";
        version = "0.1.12";
        sha256 = "0b5ycmnjsi1jc8mbzapzxxpxihz1zfpp2pxj1h0fzmwk1icjbhck";
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
        version = "2.1.14";
        sha256 = "113w2iis4zi4z3sqc3vd2apyrh52hbh2gvmxjr5yvjpmrsksclbd";
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
        version = "0.16.17";
        sha256 = "0mxv361gknlq2caab5m7psj9c5j0lila3jaagy6l3ja2kzz1bd6k";
      }

      {
        name = "language-julia";
        publisher = "julialang";
        version = "1.0.10";
        sha256 = "04mc4z5x72v8g25b60zjxn3wpjhbp9s6wa50bvx5cdbrvcfg5ngs";
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
        version = "0.2.416";
        sha256 = "0f77l5i0pyd229r4kw63cwbpj3myayh50cfrz2b54j8fl07krfga";
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
        version = "1.28.0";
        sha256 = "1ybwnyb57w020p0fgpqaviajdrdmy1gk8xq50l8d5zwc81cyknyv";
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
        version = "1.9.0";
        sha256 = "10xih3djdbxvndlz8s98rf635asjx8hmdza49y67v624i59jdn3x";
      }

      {
        name = "vscode-pylance";
        publisher = "ms-python";
        version = "2020.12.2";
        sha256 = "0dd2kwkb0a590jkhyg9kdl2fgmzky5yrkvijx41hw6f91gnhyl53";
      }

      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2020.12.414227025";
        sha256 = "1zv5p37qsmp2ycdaizb987b3jw45604vakasrggqk36wkhb4bn1v";
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
        version = "1.0.3375";
        sha256 = "0mfjlfs24m8s2z0a80gh4j6sxwa7vwi6gqsgm0wk2wggb2bjvd0w";
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
        version = "0.73.0";
        sha256 = "0hs45133kwpq8c2bp1gwpggf2xnbnkxrmswbivpk4x9fml8yw9rg";
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
        version = "0.5.0";
        sha256 = "0rhdnj8vfpcvy771l6nhh4zxyqspyh84n9p1xp45kq6msw22d7rx";
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
        version = "0.30.0";
        sha256 = "0dawszx8bclvn6qg9vagxhjfh8d2h9paas6775m6p182flq7ap38";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.12.1";
        sha256 = "1xx84qg1jvhdxlrr3iki5zaggzm25a41vpdkxjdbkzfq41l1w6p1";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.26.1";
        sha256 = "0hyvdg3sdr5bmjjkx4p80vkckf8y4qwjlq9zx5a61nm8rib2krkg";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.27.0";
        sha256 = "12rk1v2jj8w2n6w2mm7a4ylw71y0pmc0zgbymjp1mn6rarriv9kg";
      }
    ];
  };
}
