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
        version = "3.0.2";
        sha256 = "15w1ixvp6vn9ng6mmcmv9ch0ngx8m85i1yabxdfn6zx3ypq802c5";
      }
      
      {
        name = "Bookmarks";
        publisher = "alefragnani";
        version = "13.3.1";
        sha256 = "0q3zc84f4dl9zhsr6j569bm4jgyjlrzn9zf3fcpw871wnak8b509";
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
        version = "2022.8.3105";
        sha256 = "11axaxi06j0hb9xv35azqy4fys15pllg67gk3sqsc3s66q4qzk6w";
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
        version = "2.4.0";
        sha256 = "0grqsb6snj8817saialdgx0ilblky5jw4i8yxaf8nymiysywzkyq";
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
        version = "1.46.6822";
        sha256 = "1i13068bl3cp7qg8jmn62jq8715kvvp8lrfmm2drplbx9l5ndg9g";
      }
      
      {
        name = "vscode-pull-request-github";
        publisher = "GitHub";
        version = "0.51.2022092209";
        sha256 = "1g19qlnb8ffh932qk6sb5j1gcm6vl1i9j0c59k58g3ldsl3wj5i6";
      }
      
      {
        name = "go";
        publisher = "golang";
        version = "0.35.2";
        sha256 = "1nkf96wsnlaimganx0kn4lhdajpnps5rsm8dhyh0j8vdlw3wl0v1";
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
        version = "2.2.1";
        sha256 = "14p9g07zsb3da4ilaasgsdvh3wagfzayqr8ichsf6k5c952zi8fk";
      }
      
      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "8.29.0";
        sha256 = "0zvpn7vp6mf7i06l489gzj7sqrw3ipxfsgcig6ksdlxjvz22a44j";
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
        version = "0.1.23";
        sha256 = "0i5zqfz2ic57z9b4v6mrs68dzhvgpnr5984srjapi0nzm30k127b";
      }
      
      {
        name = "lean";
        publisher = "jroesch";
        version = "0.16.55";
        sha256 = "06rf1hv0226qql899zqg1ccnf8sgi208k9s2hrirshwmz16lk2rx";
      }
      
      {
        name = "language-julia";
        publisher = "julialang";
        version = "1.7.12";
        sha256 = "18ci999sp71x3837g09pyl945s50j50k5wvj1893ansj9gm2ral3";
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
        version = "0.6.32";
        sha256 = "13rs6pb75vsimsh0rg1khfc6mh6gqfpgk90a1p067rp6b02xdlbz";
      }
      
      {
        name = "mips";
        publisher = "kdarkhan";
        version = "0.1.0";
        sha256 = "00i853yshgx9m8kprv6y5swz8i7rqqbvz9wd2dlnvfc4nsbn9y6m";
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
        version = "2022.9.31";
        sha256 = "0wckigj2n943xxx5x8aw822zvwf2xc7ydv8l4fs08cmjsmxfk5m2";
      }
      
      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2022.9.1002681037";
        sha256 = "19mafb0dj7h8y87srnvbaglyvcrwl56rsqxivl0navfs0zgl07sn";
      }
      
      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.252.0";
        sha256 = "1yrjfxccvg7j64l47ixzc7r1234r7nqk0j3500a8ihfi6qi7cxx5";
      }
      
      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.87.2022090715";
        sha256 = "02qr68q5fc5kfs2qwjnfmapr6x5b1lbbrs3bks783svlnqdgbr76";
      }
      
      {
        name = "azure-account";
        publisher = "ms-vscode";
        version = "0.11.1";
        sha256 = "051cfhgvz6mkmp5i7f4fv7kykbiwhqcc3hswsbw93jqh8l33qnym";
      }
      
      {
        name = "cmake-tools";
        publisher = "ms-vscode";
        version = "1.13.7";
        sha256 = "037rssnzgfxskbx6id13yzpg1q7rd3w1k2ivb33bm9wsnxqka3dz";
      }
      
      {
        name = "hexeditor";
        publisher = "ms-vscode";
        version = "1.9.8";
        sha256 = "063n4plhbjm6l5gip6j158n6hgydiccq1f8rc1pgsbfjn3d4612y";
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
        version = "1.0.5723";
        sha256 = "0qd40ym05n95cqb617jxs8j9x67r2h42yz5bbbgni3qv1ryzlfmr";
      }
      
      {
        name = "gremlins";
        publisher = "nhoizey";
        version = "0.26.0";
        sha256 = "1sfs98nxm5ylcjrmylr5y68ddml8cfg1q1wdm7wvhfhjqx4kig9h";
      }
      
      {
        name = "explorer-exclude";
        publisher = "PeterSchmalfeldt";
        version = "1.3.2";
        sha256 = "1khvs655dl0gn69azx1hzv9czli1kc7w18dfwirqkdibf1zxvg07";
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
        version = "1.11.2022092404";
        sha256 = "sha256-K2TaoDyupXW+UhMuV3vy1Yg7yRrcUNTmCokotv1LPng=";
      }
      
      {
        name = "r";
        publisher = "REditorSupport";
        version = "2.5.3";
        sha256 = "07wwxbl27njzx013jv7wcph15mjqvrcjg9zizrzbjkhkc962cvhg";
      }
      
      {
        name = "rust-analyzer";
        publisher = "rust-lang";
        version = "0.4.1220";
        sha256 = "sha256-aGI5HH3DrjXpWZTAmA6BFQ8YXtTYgEBhqwUu2+GhG3Q=";
      }
      
      {
        name = "jinjahtml";
        publisher = "samuelcolvin";
        version = "0.18.0";
        sha256 = "0f6w81g7jak6bywi2gfdnqvi0rl4h30f5lhxi6scxaqglhs0icp7";
      }
      
      {
        name = "scala";
        publisher = "scala-lang";
        version = "0.5.6";
        sha256 = "004zc3id5jk8hk6q27g4p36prvnlqdsgda0gd6xvs4gamhywhb3s";
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
        version = "1.2.3";
        sha256 = "0k1p9lzgcmdas23d33wm0x3n72kq0xicijzali167gdgnxbfvknf";
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
        version = "3.6.0";
        sha256 = "1sv8vlzmynbz20vmv901nrg12wcmsg5i9pm6mqq32rlgb7rw3p50";
      }
      
      {
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.44.2022092202";
        sha256 = "03ixs71w6jalxvadm9151i41d1cv67j2blak6vxf0l2k85z1ldqy";
      }
      
      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.25.2022090600";
        sha256 = "0k1zhxgg9nlsq141zj9p1nlsiad4rmxs2fii9mysrv76brzdxbrg";
      }
      
      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.37.2022090902";
        sha256 = "17i9jfwpjjxp81dg6nnviczzmr47pvz33zc4bwfvz69ckn6v74j4";
      }
      
      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.38.2022090603";
        sha256 = "04nrrsqpip03i2jsggsfxi3ify5i09hg14yvjwpnsqgpqs8cvqp1";
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
