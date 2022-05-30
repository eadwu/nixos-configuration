final: prev:

with final.pkgs; {
  vscode-insiders-with-extensions = prev.vscode-insiders-with-extensions.override {
    vscodeExtensions = with vscode-extensions; [
      ms-python.python
      ms-vscode.cpptools
    ] ++ vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "better-comments";
        publisher = "aaron-bond";
        version = "3.0.0";
        sha256 = "17b7m50z0fbifs8azgn6ygcmgwclssilw9j8nb178szd6zrjz2vf";
      }

      {
        name = "Bookmarks";
        publisher = "alefragnani";
        version = "13.3.0";
        sha256 = "0mia2q1al9n0dj4icq0gcl07im7ix2090nj99q9jy5xwcavzpavj";
      }

      {
        name = "vscode-sqlite";
        publisher = "alexcvzz";
        version = "0.14.0";
        sha256 = "1zdxk3004d29njvwxviddiw15v2zk6av8lhszhh064ck9bm6alfj";
      }

      {
        name = "vscode-bazel";
        publisher = "BazelBuild";
        version = "0.5.0";
        sha256 = "0gjf42xjhzwbncd6c8p7c60m44bkhk2kcpa3qjg2vr619p0i5514";
      }

      {
        name = "solargraph";
        publisher = "castwide";
        version = "0.23.0";
        sha256 = "0ivawyq16712j2q4wic3y42lbqfml5gs24glvlglpi0kcgnii96n";
      }

      {
        name = "path-intellisense";
        publisher = "christian-kohler";
        version = "2.8.0";
        sha256 = "04vardis9k6yzaha5hhhv16c3z6np48adih46xj88y83ipvg5z2l";
      }

      {
        name = "doxdocgen";
        publisher = "cschlosser";
        version = "1.4.0";
        sha256 = "1d95znf2vsdzv9jqiigh9zm62dp4m9jz3qcfaxn0n0pvalbiyw92";
      }

      {
        name = "vscode-eslint";
        publisher = "dbaeumer";
        version = "2.2.3";
        sha256 = "0sl9d85wbac3h79a5y5mcv0rhcz8azcamyiiyix0b7klcr80v56d";
      }

      {
        name = "githistory";
        publisher = "donjayamanne";
        version = "0.6.19";
        sha256 = "15s2mva9hg2pw499g890v3jycncdps2dmmrmrkj3rns8fkhjn8b3";
      }

      {
        name = "gitlens";
        publisher = "eamodio";
        version = "12.0.7";
        sha256 = "0g5kxc3b6hhxhjvmdviviy7yv615nqi92wqv1rg7wzv1vg565y40";
      }

      {
        name = "vsc-material-theme";
        publisher = "Equinusocio";
        version = "33.4.0";
        sha256 = "11ljird5ja3r0ada639k0bdfdfq2rx0q49nh42cpglg3djh4mn06";
      }

      {
        name = "vsc-material-theme-icons";
        publisher = "equinusocio";
        version = "2.3.1";
        sha256 = "1djm4k3hcn4aq63d4mxs2n4ffq5x1qr82q6gxwi5pmabrb0hrb30";
      }

      {
        name = "auto-rename-tag";
        publisher = "formulahendry";
        version = "0.1.10";
        sha256 = "0nyilwfs2kbf8v3v9njx1s7ppdp1472yhimiaja0c3v7piwrcymr";
      }

      {
        name = "copilot";
        publisher = "GitHub";
        version = "1.24.6022";
        sha256 = "1dv7pzs4206z3hfbh2rk4rxqd131zqjgj9zhbyd0pvzqfafmksln";
      }

      {
        name = "vscode-pull-request-github";
        publisher = "GitHub";
        version = "0.43.2022053009";
        sha256 = "1yjpjf94hnfi7pxkhlcqj90ryh478k5ka5xwqvjc42jnq79kzd2p";
      }

      {
        name = "go";
        publisher = "golang";
        version = "0.33.1";
        sha256 = "0dsjxs04dchw1dbzf45ryhxsb5xhalqwy40xw6cngxkp69lhf91g";
      }

      {
        name = "todo-tree";
        publisher = "Gruntfuggly";
        version = "0.0.215";
        sha256 = "0lyaijsvi1gqidpn8mnnfc0qsnd7an8qg5p2m7l24c767gllkbsq";
      }

      {
        name = "haskell";
        publisher = "haskell";
        version = "2.2.0";
        sha256 = "0qgp93m5d5kz7bxlnvlshcd8ms5ag48nk5hb37x02giqcavg4qv0";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "8.26.0";
        sha256 = "1isgrxr71ylqzhg133mknkr57pf2jgx25lx17qsn5304ccs1n8b4";
      }

      {
        name = "better-cpp-syntax";
        publisher = "jeff-hykin";
        version = "1.15.14";
        sha256 = "12h9r9zfpwj6752q1cgd1xinf3xbf6d861gzzhd5wi33g10whafm";
      }

      {
        name = "nix-ide";
        publisher = "jnoortheen";
        version = "0.1.20";
        sha256 = "16mmivdssjky11gmih7zp99d41m09r0ii43n17d4i6xwivagi9a3";
      }

      {
        name = "lean";
        publisher = "jroesch";
        version = "0.16.50";
        sha256 = "06sn6c9kvgmh44h0xdixx2rbsa3hk57yhfk3rv1z46b0bd04a2fz";
      }

      {
        name = "language-julia";
        publisher = "julialang";
        version = "1.6.17";
        sha256 = "1dk6i72zb6cpzlxns6q7h9cnbn587r3y148g4px6v5dyshk2s6xa";
      }

      {
        name = "language-haskell";
        publisher = "justusadam";
        version = "3.6.0";
        sha256 = "115y86w6n2bi33g1xh6ipz92jz5797d3d00mr4k8dv5fz76d35dd";
      }

      {
        name = "magit";
        publisher = "kahole";
        version = "0.6.29";
        sha256 = "04nf98c1z384zsxkydxv6lvcwzymp7g0x69h8csmpaa3pfydw208";
      }

      {
        name = "mips";
        publisher = "kdarkhan";
        version = "0.0.9";
        sha256 = "1cygc2f09z7q2fig1c2r7kmn7jx08v96952b0nmksfazblhmff5y";
      }

      {
        name = "noctis";
        publisher = "liviuschera";
        version = "10.40.0";
        sha256 = "1ry0vkyb92c6p6i8dpjq7sihvbpl45gngb8fym22nylmnfi9dcai";
      }

      {
        name = "vscode-language-babel";
        publisher = "mgmcdermott";
        version = "0.0.36";
        sha256 = "0v2xqry7pgwnzxi534v2rrbkfz9gvvbyc2px2g0xpbaaz3rrz6kd";
      }

      {
        name = "git-graph";
        publisher = "mhutchie";
        version = "1.30.0";
        sha256 = "000zhgzijf3h6abhv4p3cz99ykj6489wfn81j0s691prr8q9lxxh";
      }

      {
        name = "vscode-clang";
        publisher = "mitaki28";
        version = "0.2.4";
        sha256 = "0sys2h4jvnannlk2q02lprc2ss9nkgh0f0kwa188i7viaprpnx23";
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
        version = "1.22.0";
        sha256 = "12qfwfqaa6nxm6gg2g7g4m001lh57bbhhbpyawxqk81qnjw3vipr";
      }

      {
        name = "vscode-pylance";
        publisher = "ms-python";
        version = "2022.5.3";
        sha256 = "0qzw33s3lg75ammr28xwnf5n2rfxnv6qvfdnjaaamm3rg82lm9w7";
      }

      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2022.5.1001491011";
        sha256 = "0l3lng6laj8wmkh8sdhqc5swbr6cnjrl5qxm9sb9f4xdca539rx0";
      }

      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.236.1";
        sha256 = "0syfy058kxccwbmgqj9pm9rrldrz9panbm234abpwgnz4l71mnli";
      }

      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.81.2022052415";
        sha256 = "01sm3fcydky7gyilkiblyvbjz48nsf7x4mjl1x0drfkapqp8lfj0";
      }

      {
        name = "azure-account";
        publisher = "ms-vscode";
        version = "0.10.1";
        sha256 = "009rv9b7n9na3bz0y1xwk8bcsphvkrg94i6db3jijicd0w2yympz";
      }

      {
        name = "cmake-tools";
        publisher = "ms-vscode";
        version = "1.11.23";
        sha256 = "1ql2qcm8jsisxwdybhab7pi9m8ss1dkk7kimw96jr7njxhhh1xnc";
      }

      {
        name = "hexeditor";
        publisher = "ms-vscode";
        version = "1.9.6";
        sha256 = "0yir356rsxdn9vyk0q640ag6lxwhkx123gv1yp0058v9ccxym1hn";
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
        version = "1.0.5597";
        sha256 = "082h920x38584c9z9l2p47asm8r8hbm87x7yb5bygs282dyn0bav";
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
        version = "1.7.2022052804";
        sha256 = "1albayhrha61kvd4gkasdzmh948v91krkz3qh6san1crsnw4v7m5";
      }

      {
        name = "r";
        publisher = "REditorSupport";
        version = "2.5.0";
        sha256 = "1w9rq85ld9dc47vyhga6581l86h2vi0bqzzl8cq8bn1z64q5yiiq";
      }

      {
        name = "explorer-exclude-vscode-extension";
        publisher = "RedVanWorkshop";
        version = "1.2.0";
        sha256 = "02cfkyk0b7giasc9l08a1cj51spvcqc9qmndc48k1yanm4xhzxf9";
      }

      {
        name = "rust-analyzer";
        publisher = "rust-lang";
        version = "0.4.1074";
        sha256 = "1275kksyb3b9rq0gsfxq4zg1fvwal98r6sz1mq8whsznrq95drap";
      }

      {
        name = "jinjahtml";
        publisher = "samuelcolvin";
        version = "0.17.0";
        sha256 = "120z8barzgva0sr1g7xj4arpjz96v4zxh2zgk56jzdgnafzyq71b";
      }

      {
        name = "scala";
        publisher = "scala-lang";
        version = "0.5.5";
        sha256 = "1gqgamm97sq09za8iyb06jf7hpqa2mlkycbx6zpqwvlwd3a92qr1";
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
        version = "1.2.2";
        sha256 = "00v31vsp6nnw6zvv6a854cvzh63y9l712z57hh7na4x9if9pk9bg";
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
        version = "3.5.1";
        sha256 = "17xbbr5hjrs67yazicb9qillbkp3wnaccjpnl1jlp07s0n7q4f8f";
      }

      {
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.41.2022053008";
        sha256 = "0yil00glfrw312ylqwvby8gv1p61clahzbky5n24k5pi5j8qxbh9";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.22.2022052400";
        sha256 = "06qpp73f1y3yikr6mdnysh7lppdsn7kkrr683gqnv0qlslph11gq";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.35.2022051902";
        sha256 = "0392f85jlsndjlzwlw1ylvlp12bmm8yxsn08xvihhaqzvc17li6z";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.35.2022053003";
        sha256 = "00zwl0zi2698aliy34bfi0ykf73dy6r86qipsz799vbd49pb53mc";
      }

      {
        name = "vscode-wakatime";
        publisher = "WakaTime";
        version = "18.1.5";
        sha256 = "0j934rjna223ssbj0iiw3jsdini0gsrhb6j4sch5qn99f6n2g5a7";
      }
    ];
  };
}
