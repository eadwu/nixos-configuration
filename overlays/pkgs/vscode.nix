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
        version = "13.2.2";
        sha256 = "17fyk8hr9ml0fx6qfyrkd0hbsb9r9s4s95w3yzly2glbwpwn5mm5";
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
        version = "2.4.2";
        sha256 = "1a4d1n4jpdlx4r2majirnhnwlj34jc94wzbxdrih615176hadxvc";
      }

      {
        name = "vscode-eslint";
        publisher = "dbaeumer";
        version = "2.2.2";
        sha256 = "17j4czb1lxgy62l0rsdf06ld3482cqplxglsh7p4zyp50p4samln";
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
        version = "11.6.1";
        sha256 = "0nghanaxa5db7lxfi4nly45iaps560zkwsfhmzhiiaan0hj0qmcs";
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
        version = "2.2.1";
        sha256 = "03mxvm8c9zffzykc84n2y34jzl3l7jvnsvnqwn6gk9adzfd2bh41";
      }

      {
        name = "auto-rename-tag";
        publisher = "formulahendry";
        version = "0.1.9";
        sha256 = "1xk8rzda16qgdxhq8bz6f8w09fd9044qczx1wfhszd6w3r4q9262";
      }

      {
        name = "copilot";
        publisher = "GitHub";
        version = "1.7.3822";
        sha256 = "1qy4kb8vgz2i6287ql6jwkm5040f8h52v5n9scyfvmgaqr2jlwn6";
      }

      {
        name = "vscode-pull-request-github";
        publisher = "GitHub";
        version = "0.32.0";
        sha256 = "0v5dhn0b0g9zfa0gj4l84zngnir8vlmyrkk9nfq839hgcdxyk9px";
      }

      {
        name = "go";
        publisher = "golang";
        version = "0.29.0";
        sha256 = "1ky5xnl300m42ja8sh3b4ynn8k1nnrcbxxhn3c3g5bsyzsrr1nmz";
      }

      {
        name = "todo-tree";
        publisher = "Gruntfuggly";
        version = "0.0.214";
        sha256 = "0rwxjnrl44rnhx3183037k6435xs4772p58a37azl5cahsyav1hk";
      }

      {
        name = "haskell";
        publisher = "haskell";
        version = "1.7.1";
        sha256 = "11myrk3hcc2hdw2n07w092s78aa6igpm7rgvn7ac9rbkkvc66rsi";
      }

      {
        name = "r";
        publisher = "Ikuyadeu";
        version = "2.3.2";
        sha256 = "04f6f6vkn0b53ab1zvslaf6rl4915k3gkcwayb6x4pmj8rpd06wl";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "8.21.1";
        sha256 = "0wg4ykdyklysl4ija0cj37ya2jqf9qsldc6l9gy7a8ffpd30xqcx";
      }

      {
        name = "nix-ide";
        publisher = "jnoortheen";
        version = "0.1.18";
        sha256 = "1v3j67j8bydyqba20b2wzsfximjnbhknk260zkc0fid1xzzb2sbn";
      }

      {
        name = "lean";
        publisher = "jroesch";
        version = "0.16.39";
        sha256 = "0v1w0rmx2z7q6lfrl430fl6aq6n70y14s2fqsp734igdkdhdnvmk";
      }

      {
        name = "language-julia";
        publisher = "julialang";
        version = "1.5.4";
        sha256 = "1n2p2gbcqy03z91k5dllqzwylxsdqj9qh4lwdhwsjc3ifx0qfih5";
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
        version = "0.6.24";
        sha256 = "16yhdavg5lgc27jc2x1rl2fmshj654dgagmhf9h6wasyhrazjxad";
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
        version = "0.2.809";
        sha256 = "1km36nsjg7dm4s033qc17fz7jkpq9vnh6ymvk6ry9y4p1xpb17yd";
      }

      {
        name = "vscode-language-babel";
        publisher = "mgmcdermott";
        version = "0.0.35";
        sha256 = "1163apwv60rhf67x8y28kqbhqdgqfr6hzp57ig0mq06bnf1x3r4s";
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
        version = "1.17.0";
        sha256 = "01na7j64mavn2zqfxkly9n6fpr6bs3vyiipy09jkmr5m86fq0cdx";
      }

      {
        name = "vscode-pylance";
        publisher = "ms-python";
        version = "2021.11.1";
        sha256 = "0i0h091c059c5lb536qf9sflhzgs5hj9ywxnqhbqa2589l7bn24n";
      }

      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2021.11.1001452373";
        sha256 = "1w9ms2nq7vkjvi6mjc155ri84wrxgsvr6fpxygprdly5mjgjivkg";
      }

      {
        name = "azure-account";
        publisher = "ms-vscode";
        version = "0.9.11";
        sha256 = "0w389gqy6m35vdvl59x08wk2f63b8wllc8a1aclbs6hj9qrbg5ig";
      }

      {
        name = "hexeditor";
        publisher = "ms-vscode";
        version = "1.8.2";
        sha256 = "106k40gfcgjqcflnmdrr777wn0sb5m6fv1smsh692znd9bndf02k";
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
        version = "1.0.5090";
        sha256 = "0pc4ls5w72vbf7lywd59rh7wf8icdz9w7czqzcnq5ic63452s3l1";
      }

      {
        name = "debugger-for-chrome";
        publisher = "msjsdiag";
        version = "4.13.0";
        sha256 = "0r6l804dyinqfk012bmaynv73f07kgnvvxf74nc83pw61vvk5jk9";
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
        version = "1.0.0";
        sha256 = "1mc5zjx9r08jpz1qz8g8d2yzaqjsbzhzqhzb35i1m5dpgrd4rsrv";
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
        version = "1.1.0";
        sha256 = "1kb1b9jdd4dqh63j2rysi5q1xlyw7z5airgfblicadziwr6fsl1a";
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
        version = "3.4.1";
        sha256 = "1mr8si7jglpjw8qzl4af1k7r68vz03fpal1dr8i0iy4ly26pz7bh";
      }

      {
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.36.0";
        sha256 = "1p9mymbf8sn39k44350zf3zwl29fhcwxfsqxr7841ch1qz88w9r8";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.18.6";
        sha256 = "095jdvvv4m8s2ymnrsq0ay7afqff5brgn6waknjfyy97qb3mzxj8";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.32.0";
        sha256 = "0lq6daz228ipzls88y09zbdsv9n6backs5bddpdam628rs99qvn3";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.34.1";
        sha256 = "1mnlvnl2lg8fijxx4a6rqjix9k2j82js8kn8da7kjf4wh0ksdgvd";
      }
    ];
  };
}
