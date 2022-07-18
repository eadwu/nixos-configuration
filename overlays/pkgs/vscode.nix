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
        version = "0.14.1";
        sha256 = "1iaklnhw74iwyjw74prnrx34ba25ra7ld71zlip04lv401329r4c";
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
        version = "2.8.1";
        sha256 = "1j7q4mzj173sl6xl3zjw40hnqvyqsrsczakmv63066k4k0rb6clm";
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
        version = "2.2.6";
        sha256 = "0m16wi8slyj09r1y5qin9xsw4pyhfk3mj6rs5ghydfnppb45w9np";
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
        version = "12.1.2";
        sha256 = "0wpmfrfpi6wl9v3dknx2qr2m74azpcw8bvhac21v67w6jxnl3jd9";
      }

      {
        name = "vsc-material-theme";
        publisher = "Equinusocio";
        version = "33.5.0";
        sha256 = "1pr98mx7hji8jlm6ppac693ivbcpybh043w2z8sa3f49v7pksnrf";
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
        version = "1.31.6194";
        sha256 = "1305l7alabs8bw6yj7m3pcvihbrag1gmmmg80pb0qxzgj7g2xdd1";
      }

      {
        name = "vscode-pull-request-github";
        publisher = "GitHub";
        version = "0.47.2022071415";
        sha256 = "1jmki48n7lq77yxsj5j885b5vb2kw1idyhgxav7mri35rv7fxj89";
      }

      {
        name = "go";
        publisher = "golang";
        version = "0.34.1";
        sha256 = "0q0xgmv7g77rnx8mzvaws5lh6za98h9hks06yhyzbc98ylba3gff";
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
        version = "8.27.2";
        sha256 = "1aq98sqmfsglr0mi1ls4xp7fikhq61ammq9awg3bfcp5r3lx7jxi";
      }

      {
        name = "better-cpp-syntax";
        publisher = "jeff-hykin";
        version = "1.15.19";
        sha256 = "13v1lqqfvgkf5nm89b39hci65fnz4j89ngkg9p103l1p1fhncr41";
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
        version = "0.16.53";
        sha256 = "17l36nc14f6y5mx71s10wq2dzdy5phksqqrgrc20la88bcyrf7xk";
      }

      {
        name = "language-julia";
        publisher = "julialang";
        version = "1.6.24";
        sha256 = "094hb1yvv54ixlpcsyj26s398wa19wsvwbf849g5x5c8w0s8sj5b";
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
        version = "1.22.1";
        sha256 = "1ix363fjxi9g450rs3ghx44z3hppvasf0xpzgha93m90djd7ai52";
      }

      {
        name = "vscode-pylance";
        publisher = "ms-python";
        version = "2022.7.31";
        sha256 = "19abk08r3z1kryim95yz7y4khda3i2fqfcl9zlxf7gclhb146id7";
      }

      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2022.7.1001981020";
        sha256 = "1ga2a4fdv8p0jk6pvf20r9h7pgi8i7nws98r3p63dw524xfzc89r";
      }

      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.242.0";
        sha256 = "0zricxw1fyh4j8xb8wxgk6q1f8llji5460c486vdpk129p8dmcbh";
      }

      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.85.2022071315";
        sha256 = "195c22wvvw727li8wf0nhfpccgynx9sd48gzz39j8wxmi7qqvjli";
      }

      {
        name = "azure-account";
        publisher = "ms-vscode";
        version = "0.11.0";
        sha256 = "02qkpirsvr2m1b18vnzmxqcx77ccr5d38s3wg6lvdndv00niyry3";
      }

      {
        name = "cmake-tools";
        publisher = "ms-vscode";
        version = "1.12.13";
        sha256 = "07bv5plrl9zg64qwfal9l3iq6hmqx29fl39b4shz8swpq15brnw5";
      }

      {
        name = "hexeditor";
        publisher = "ms-vscode";
        version = "1.9.7";
        sha256 = "1hv0am6y4d4dggq8viw4f5x6mavah11dqrrxa15lwm2a5ias93xx";
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
        version = "1.0.5641";
        sha256 = "0vr2crlcc0gg4z9hbpjnjap9ly5h4fvp744f4zwr0nxb3y83pvvm";
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
        version = "1.9.2022071304";
        sha256 = "sha256-7gpSK6324jXwOxeMgr0n0CnJThEr0Ihx+LaWVtTp6EY=";
      }

      {
        name = "r";
        publisher = "REditorSupport";
        version = "2.5.2";
        sha256 = "16lla2i0wwvc3y73ii3s6yffgpqmvx1qy9iygwbg5rs13abqnsd8";
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
        version = "0.4.1130";
        sha256 = "sha256-1NW9KBlF+HqPio2Eg8AymmlB2+1o/PyWJgy66W1ShzA=";
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
        version = "3.5.2";
        sha256 = "0d8xjzq4ykyh9w9f42pr8rhv71gyjfnv2pbcirjg5cblayg1g40l";
      }

      {
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.42.2022071423";
        sha256 = "0qpyp501wv7r1wcffkdn88x38r93x92bvda81xry9by4is7jrmpn";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.24.2022071500";
        sha256 = "0hjv4vwagzfmgpqjiv3iwr20w1zp67g6fqipqigfi9gg6cwvds6s";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.35.2022071502";
        sha256 = "0vdsls9kp8wqng8pllapjkhz30j0xc0knd5ql21nvxx8vfsh3a31";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.36.2022071503";
        sha256 = "180kvgc7d8bjdlv8jd34hwg84gfashl74mr9k3rh7s0hx415sfj7";
      }

      {
        name = "vscode-wakatime";
        publisher = "WakaTime";
        version = "18.1.6";
        sha256 = "15ldc9774jgwqlw5qfrdmpmgdyvps2rkn2lh7v2f0w457x9h52lx";
      }
    ];
  };
}
