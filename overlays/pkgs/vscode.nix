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
        version = "2.1.0";
        sha256 = "0kmmk6bpsdrvbb7dqf0d3annpg41n9g6ljzc1dh0akjzpbchdcwp";
      }

      {
        name = "Bookmarks";
        publisher = "alefragnani";
        version = "13.2.4";
        sha256 = "0376hs09wypn781s4cz3qb74qvsxck0nw1s39bfsgpqi0rgvwa9f";
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
        version = "12.0.5";
        sha256 = "0zfawv9nn88x8m30h7ryax0c7p68najl23a51r88a70hqppzxshw";
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
        version = "2.2.1";
        sha256 = "03mxvm8c9zffzykc84n2y34jzl3l7jvnsvnqwn6gk9adzfd2bh41";
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
        version = "1.11.5453";
        sha256 = "1n8mwb5spwn0ig5bq5dgxzqmk56k360q1cj2dcmc0iq26rig6lxx";
      }

      {
        name = "vscode-pull-request-github";
        publisher = "GitHub";
        version = "0.41.2022033109";
        sha256 = "02iqf7pm2ldfw9xwlibl97nywyfkmnvj26y2s9jia1hvhwb6s7ql";
      }

      {
        name = "go";
        publisher = "golang";
        version = "0.32.0";
        sha256 = "0a3pmpmmr8gd0p8zw984a73cp2yyi4lvz0s03msvkrxmn5k9xhis";
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
        version = "1.8.0";
        sha256 = "0yzcibigxlvh6ilba1jpri2irsjnvyy74vzn3rydcywfc17ifkzs";
      }

      {
        name = "r";
        publisher = "Ikuyadeu";
        version = "2.4.0";
        sha256 = "18xdxd0i9qc03yg9imm7cxk69ladmz8530w5bdf4kbk2lfvjl4cq";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "8.24.1";
        sha256 = "075ym4f1ajfaxnpyvqi0jwk3079lng1qnr24hhpw3z2yd433vx4i";
      }

      {
        name = "better-cpp-syntax";
        publisher = "jeff-hykin";
        version = "1.15.13";
        sha256 = "1sm40wjiihi4f1zf748bfgp83ihxjrimkzv0xrvqdz3k8jfgn2ds";
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
        version = "0.16.46";
        sha256 = "1bwc9q4vn5hmrnjxzrwlf22wm1m627jmr31ywirimsxs1fxp5h84";
      }

      {
        name = "language-julia";
        publisher = "julialang";
        version = "1.6.15";
        sha256 = "002ki8wa2blwkzm00722m2mhglfy3p0wgixmm1q4shglr0034gr2";
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
        name = "rust-analyzer";
        publisher = "matklad";
        version = "0.3.1000";
        sha256 = "00pq2dyzppd0wbj0mxj7r5j593s1zcybnz7n1madnsm7qc1xxqdr";
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
        version = "1.21.0";
        sha256 = "12rll1wn6xs1fzb391598pih3qw8dq4vdmyvmcind0ns42hsmlan";
      }

      {
        name = "vscode-pylance";
        publisher = "ms-python";
        version = "2022.3.4";
        sha256 = "0r1rgbw7kp5k5d1jvkcf0pwj8cwxyhg7hcsc3lf2nghxywzh065i";
      }

      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2022.4.1000912146";
        sha256 = "11404ravwy04jadr72i7xiy81j5ql2qzza9ff6j1pw46nnybhk5x";
      }

      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.232.2";
        sha256 = "02y6clv0fpmnjwdk47bcppj2mjcv8i82j79sakng6nxdaa22szcw";
      }

      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.78.0";
        sha256 = "1743rwmbqw2mi2dfy3r9qc6qkn42pjchj5cl8ayqvwwrrrvvvpxx";
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
        version = "1.11.3";
        sha256 = "1iarzd0h43hw5ncvl9fw50i67ha7migrs36h7wdrnsrcm8d1sjvl";
      }

      {
        name = "hexeditor";
        publisher = "ms-vscode";
        version = "1.9.5";
        sha256 = "1wq2wlkwfdd9my3287hm53zi34izsbvv1ichgiprzkahqdxczybs";
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
        version = "1.0.5449";
        sha256 = "1i7qn2v0s21pqfdrs9g9cz3f2ydxq763vlfxvp98x38x65zmd920";
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
        version = "1.4.0";
        sha256 = "17931p192bc5hr327m3cm0iaj33b28fl40mq94s4xa0gq6issgjm";
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
        version = "3.4.2";
        sha256 = "1ifz0iyc7zknb07qx2fixg3qw9i69pvr12rlg2yvg1s8paj8mnbx";
      }

      {
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.40.2022033102";
        sha256 = "19hikn5rvdhbwvi58r6l77kv3ca2l7v6n21zjl3s3n3sib0ghvx2";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.22.2022040100";
        sha256 = "1s00jvi545zh642iqs85w08x06ka2wc7m7cjljc1c5gl9kx5j2vs";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.34.2022033002";
        sha256 = "10npdljnlqxdy3xilyyp2wkmkxc858cmdw8x7vd9jrmsbw0hci9a";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.35.2022031803";
        sha256 = "0qcydkc2dkb4zlcmn66bfk0w7k3irc0v5i9kirssdlciilc39wyj";
      }

      {
        name = "vscode-wakatime";
        publisher = "WakaTime";
        version = "18.0.8";
        sha256 = "1a83cxvfwdpgz3z7jdqcsnlakjn22f4xq3xq4i52j94zx3vmwszl";
      }
    ];
  };
}
