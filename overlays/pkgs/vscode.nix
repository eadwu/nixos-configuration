final: prev:

with final.pkgs; {
  vscode-insiders-with-extensions = prev.vscode-insiders-with-extensions.override {
    vscodeExtensions = with vscode-extensions; [
      ms-python.python
      ms-vscode.cpptools
      WakaTime.vscode-wakatime
    ] ++ vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "better-comments";
        publisher = "aaron-bond";
        version = "2.1.0";
        sha256 = "0kmmk6bpsdrvbb7dqf0d3annpg41n9g6ljzc1dh0akjzpbchdcwp";
      }

      {
        name = "Bookmarks";
        publisher = "alefragnani";
        version = "13.0.4";
        sha256 = "1h5h5d0dpsnhagiqbf3g5hzgcf2nlwiddrg4kvmgll6zd3rix21w";
      }

      {
        name = "vscode-sqlite";
        publisher = "alexcvzz";
        version = "0.11.1";
        sha256 = "1qcszjmjady47vggfa93wr6pl2iqvp66hxf75gf9iz2l5wmz267w";
      }

      {
        name = "vscode-bazel";
        publisher = "BazelBuild";
        version = "0.4.0";
        sha256 = "0p018878pxr7vxr6375fywchzq1xwvxnjrb4zvp444s6p3sknxxg";
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
        version = "2.1.19";
        sha256 = "0cgl2hvsha51fibmf7qx88d2j9zw2i2bng6bwwbivbpq73lgg24y";
      }

      {
        name = "githistory";
        publisher = "donjayamanne";
        version = "0.6.16";
        sha256 = "15dzkf7qdpv8q4bdz6m9nnhrzrcg4bwqzlwa35117xlhrxx7gvb9";
      }

      {
        name = "gitlens";
        publisher = "eamodio";
        version = "11.3.0";
        sha256 = "0py8c5h3pp99r0q9x2dgh1ryp05dbndyc5ipp999z3x1xvwnfrlv";
      }

      {
        name = "tslint";
        publisher = "eg2";
        version = "1.0.45";
        sha256 = "0x7p7ndv6c5wzw6hf45z31qr50imq7707xrd40sln4hwj599mw7m";
      }

      {
        name = "vsc-material-theme";
        publisher = "Equinusocio";
        version = "33.2.2";
        sha256 = "0a55ksf58d4fhk1vgafibxkg61rhyd6cl10wz9gwg22rykx6i8d9";
      }

      {
        name = "vsc-material-theme-icons";
        publisher = "equinusocio";
        version = "2.0.10";
        sha256 = "0ki9x63wvc1h44cy5g9i96zkmcy1a3wc4sqzw3an17qad1lsicwb";
      }

      {
        name = "auto-rename-tag";
        publisher = "formulahendry";
        version = "0.1.6";
        sha256 = "0cqg9mxkyf41brjq2c764w42lzyn6ffphw6ciw7xnqk1h1x8wwbs";
      }

      {
        name = "go";
        publisher = "golang";
        version = "0.23.3";
        sha256 = "0c8krqjjxg6l0a0ghqr3w32mn44jhnmx9dr0pmjv219makfyd9rj";
      }

      {
        name = "todo-tree";
        publisher = "Gruntfuggly";
        version = "0.0.209";
        sha256 = "1i0wq8zwax4kmy69hh0hclx9a47ycm3qp3gspjq8xpmcq3nmbfaq";
      }

      {
        name = "haskell";
        publisher = "haskell";
        version = "1.2.0";
        sha256 = "0vxsn4s27n1aqp5pp4cipv804c9cwd7d9677chxl0v18j8bf7zly";
      }

      {
        name = "r";
        publisher = "Ikuyadeu";
        version = "1.6.5";
        sha256 = "1pcpfx580svfwmwmssm2qdk28kgmm6gz9587s3f1dhy6bh39h4dm";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "8.16.1";
        sha256 = "0dpnf6z7003br5j7sxxr5v29nx3gcpyrlmmn9kzaicqxl8nzj6v9";
      }

      {
        name = "nix-ide";
        publisher = "jnoortheen";
        version = "0.1.10";
        sha256 = "0c9x3br92rpsmc7d0i3c8rnvhyvwz7hvrrfd3sds9p168lz87gli";
      }

      {
        name = "lean";
        publisher = "jroesch";
        version = "0.16.25";
        sha256 = "0qyx4qyvsbcqr2ddj7faa19dwn7hpl37ccqc7zijc2ad3hgvqqd7";
      }

      {
        name = "language-julia";
        publisher = "julialang";
        version = "1.1.38";
        sha256 = "01x6ncnilblxgaqxi77ix6sqfc5y2ndyg9cix9as4sv38sfxdlkz";
      }

      {
        name = "language-haskell";
        publisher = "justusadam";
        version = "3.4.0";
        sha256 = "0ab7m5jzxakjxaiwmg0jcck53vnn183589bbxh3iiylkpicrv67y";
      }

      {
        name = "magit";
        publisher = "kahole";
        version = "0.6.8";
        sha256 = "1rkmki489gbpxl3d98cjaachpng8fnyd7rwncf6j6084j2lx9fqn";
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
        version = "0.2.538";
        sha256 = "0ivf8yxs17x10z6q44ij3vpamwzga0wiqfg9hzp3bs6mff9szfmb";
      }

      {
        name = "vscode-language-babel";
        publisher = "mgmcdermott";
        version = "0.0.31";
        sha256 = "02qjcfa1m2crrp5j1aykh7g6npzqi2hppgpgxqszs4vmisvkfpf4";
      }

      {
        name = "git-graph";
        publisher = "mhutchie";
        version = "1.29.0";
        sha256 = "02x4nc7snsr1d1lrybgjmq85qbb2jma3rvv3v5lcry44wd9pqcs5";
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
        version = "3.1.0";
        sha256 = "1zxdsqr5h0xl6arphi5i1xfgby4cin39jxpnmdgcg41p6qr3k3z7";
      }

      {
        name = "vscode-docker";
        publisher = "ms-azuretools";
        version = "1.11.0";
        sha256 = "141800jcxslqa5nbwcdj4mwnysa42mxligvc073gf225ns984vfr";
      }

      {
        name = "vscode-pylance";
        publisher = "ms-python";
        version = "2021.3.4";
        sha256 = "0fsc04m0vwq87n22a6sh75qb0bpc4hcp9h2zyhvakhx6mm0mrn0n";
      }

      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2021.5.702919634";
        sha256 = "0z27nmmn3lx8daywvqc1gx1zgj77i19ahmixf7pn8wvxkp17mzk6";
      }

      {
        name = "azure-account";
        publisher = "ms-vscode";
        version = "0.9.7";
        sha256 = "1xvjn88kg4fn0swk1hwwqh1yxafbcr095x96fvr216dakpl6rpzm";
      }

      {
        name = "hexeditor";
        publisher = "ms-vscode";
        version = "1.4.0";
        sha256 = "1hs2q6vpj1b3pw7y439isjsjgqrfgi04680mql1b5yiq1n9g86c0";
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
        version = "1.0.4070";
        sha256 = "18dddaz5g0kbrmj9l9k0fivdj6p6y5a6iw24ikvzmypz8zql7gd5";
      }

      {
        name = "debugger-for-chrome";
        publisher = "msjsdiag";
        version = "4.12.12";
        sha256 = "0nkzck3i4342dhswhpg4b3mn0yp23ipad228hwdf23z8b19p4b5g";
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
        version = "0.28.1";
        sha256 = "179g7nc6mf5rkha75v7rmb3vl8x4zc6qk1m0wn4pgylkxnzis18w";
      }

      {
        name = "java";
        publisher = "redhat";
        version = "0.76.0";
        sha256 = "0xb9brki4s00piv4kqgz6idm16nk6x1j6502jljz7y9pif38z32y";
      }

      {
        name = "r-lsp";
        publisher = "REditorSupport";
        version = "0.1.14";
        sha256 = "0x85mg25ixafg18pgqzrwm4hi0ggjhcsznlkp0rpcca6vq8mrapf";
      }

      {
        name = "explorer-exclude-vscode-extension";
        publisher = "RedVanWorkshop";
        version = "1.2.0";
        sha256 = "02cfkyk0b7giasc9l08a1cj51spvcqc9qmndc48k1yanm4xhzxf9";
      }

      {
        name = "jinjahtml";
        publisher = "samuelcolvin";
        version = "0.16.0";
        sha256 = "17f4dzwsqpwdkzc9f35sx31mvb4zns2ya0ym7mjgl8iy1kyci66q";
      }

      {
        name = "scala";
        publisher = "scala-lang";
        version = "0.5.2";
        sha256 = "1b8ydigspgr2cni86cqrd0md61ks62y9qca3ia6dq11pvfdwxbsd";
      }

      {
        name = "shader";
        publisher = "slevesque";
        version = "1.1.5";
        sha256 = "14yraymi96f6lpcrwk93llbiraq8gqzk7jzyw7xmndhcwhazpz9x";
      }

      {
        name = "vscode-stylelint";
        publisher = "stylelint";
        version = "0.86.0";
        sha256 = "06wvrm4n39zv1qvzv4askw5329dnjnfmg6qrcdbywmafxjpkk30x";
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
        version = "3.2.5";
        sha256 = "0zdmk4k7x4qyb3zbnxiq75kzky9187nl5y23wwzjbi2mc4kbg3bk";
      }

      {
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.32.1";
        sha256 = "0qmm3r7m23n674biw2cm6khisgkydq69ikwbyppdrxvz6jsj51xi";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.13.0";
        sha256 = "1mn8wqhsxkrvzzlan5nqkryb3rsz5bxnq0b180960i493273fkw4";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.28.1";
        sha256 = "1ry2rhk79zhyslqccbf50y067plgpmf6n0yalzmd9sbm4a0vbs3q";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.28.0";
        sha256 = "11s16jg2yr888hikb6p8q2lm8jra0gbzg3msmzdzlbk3ipy6wnim";
      }
    ];
  };
}
