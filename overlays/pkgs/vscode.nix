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
        name = "vsc-material-theme-icons";
        publisher = "equinusocio";
        version = "1.2.2";
        sha256 = "06xfv8ggli88zg1hyrd7m494fl6bz4fspbxy626nsswq4f26msms";
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
        version = "2.1.17";
        sha256 = "1c895irqj99kkhikd2f7hfx6i7ml6vhdy6rlbsbhmsfiw0vhqzkb";
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
        name = "auto-rename-tag";
        publisher = "formulahendry";
        version = "0.1.6";
        sha256 = "0cqg9mxkyf41brjq2c764w42lzyn6ffphw6ciw7xnqk1h1x8wwbs";
      }

      {
        name = "go";
        publisher = "golang";
        version = "0.23.2";
        sha256 = "0l8j61idf8hhmjyc0wr6viiyrbw3mjl0makq0ijwcr6lnz72r08b";
      }

      {
        name = "todo-tree";
        publisher = "Gruntfuggly";
        version = "0.0.205";
        sha256 = "0s7bmnsx40lz9wiijrh7cnazwqvmkhsbnidl832qx27pzk0977ix";
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
        version = "1.6.4";
        sha256 = "0zz8x6v9q9n8rzf6qrxz4hz3bwz9xmb4nksb0c9mj1bx5ljgaalp";
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
        version = "0.1.7";
        sha256 = "1bw4wyq9abimxbhl7q9g8grvj2ax9qqq6mmqbiqlbsi2arvk0wrm";
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
        version = "1.1.35";
        sha256 = "079i79fzq4fa6jj6c591skd8lg293a4w5h8rn0cfk1flkf53kza5";
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
        version = "0.6.6";
        sha256 = "0gimkq3jihdikh2bdk9ljv7hc4rn92zsshf5awykd8pa0la8gxsh";
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
        version = "0.2.513";
        sha256 = "1x7a69bd8h1a33mk4j3x9vsy3m6byc19rv2mcyhciq1hk40pk47p";
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
        version = "1.10.0";
        sha256 = "0kryrvs1gm2d3kj378gsszhn4dkkgv34vir4gky7347jw2rmg7rb";
      }

      {
        name = "vscode-pylance";
        publisher = "ms-python";
        version = "2021.3.1";
        sha256 = "0p8ldfl1dvfw48ia5nfkxx986dijj39irwnacnijhn5brxf477nc";
      }

      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2021.4.641214696";
        sha256 = "0ni4664hp4031ff81w2b5pvn9h9j3l4s3gpkhjnsxn96xgqgzmbc";
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
        version = "1.0.3968";
        sha256 = "1nmhkxrlg9blxcqh7a3hl0wc5mkk2p77mn228lvmcirpbk3acsx5";
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
        version = "0.32.0";
        sha256 = "0n49bh3cq2h9v4pzcw9rihffvywqc37ikljhsjdg161r46q2f2qf";
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
