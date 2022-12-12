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
        version = "0.7.0";
        sha256 = "05wvih09184bsp4rv2m55z0sasra2qrvch5m3bkbrjq7rcqgibgx";
      }
      
      {
        name = "solargraph";
        publisher = "castwide";
        version = "0.24.0";
        sha256 = "0pcd4gwzg4rla5mz6kj4dqq30pyvsv6290an15yr89wxwcvk6qzf";
      }
      
      {
        name = "path-intellisense";
        publisher = "christian-kohler";
        version = "2.8.3";
        sha256 = "0bx0vqxk9rv23pdk1x2zz25ahpmi9aniphc7sn9qq3d3rm15njh1";
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
        version = "2.3.0";
        sha256 = "0b8rb05alb1xprbflvyp4i58hzy3ycvxrkdshd4vsd60ffaf07vx";
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
        version = "2022.12.1104";
        sha256 = "0hsg88ppxi0cifp1f5bhywm8zi530h6y9lian8y2hb2h3r9ibdzb";
      }
      
      {
        name = "vsc-material-theme";
        publisher = "Equinusocio";
        version = "33.6.0";
        sha256 = "1834pfzszn8n6aq65vpgz7kk7nfd1nlp3rbfsnzw5gvgk6rnlx44";
      }
      
      {
        name = "vsc-material-theme-icons";
        publisher = "equinusocio";
        version = "2.5.0";
        sha256 = "1cfrdadwcvkdb4mxkfiqpsq19kngnk98cm3qanv494vr2rrfbbar";
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
        version = "1.62.7527";
        sha256 = "0hjhs4bczip0cf5r31izs1iqz0ppdpzdhjhygwdmg64iky87qm3r";
      }
      
      {
        name = "vscode-pull-request-github";
        publisher = "GitHub";
        version = "0.57.2022120809";
        sha256 = "1r7c9smkqp4z0j22pi4jzcd86bj259v433qh0nvbwf4z5crxg4qa";
      }
      
      {
        name = "go";
        publisher = "golang";
        version = "0.36.0";
        sha256 = "1h6h45789qwgxz6ci3alhjgfa9kl648dpp7wszpjfyy24rifz7sw";
      }
      
      {
        name = "todo-tree";
        publisher = "Gruntfuggly";
        version = "0.0.220";
        sha256 = "06kzb4msfdv11lij4dwbn1vxdxhvnpfcjqw0gvydgkqjy7dridjk";
      }
      
      {
        name = "haskell";
        publisher = "haskell";
        version = "2.2.2";
        sha256 = "1d5b0p6r9ipwb7j4cx9w13vq31h78bh2sfwl54xri4gyvialhryd";
      }
      
      {
        name = "Ionide-fsharp";
        publisher = "Ionide";
        version = "7.4.0";
        sha256 = "1q331pgshvddd793g262w86w8ba9zkv7iqv72pk3bqqkh8kh383l";
      }
      
      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "9.1.1";
        sha256 = "1pl9rnw76a96cagl3jr3ww8bv2cd7swvzxbkyqcxvlsipzkg7psy";
      }
      
      {
        name = "better-cpp-syntax";
        publisher = "jeff-hykin";
        version = "1.17.2";
        sha256 = "1ic55cva028368j0sdcqdzjq2ikbz754m7bxibxf7djvs6xqlx57";
      }
      
      {
        name = "nix-ide";
        publisher = "jnoortheen";
        version = "0.2.1";
        sha256 = "0bibb3r4cb7chnx6vpyl41ig12pc0cbg0sb8f2khs52c71nk4bn8";
      }
      
      {
        name = "lean";
        publisher = "jroesch";
        version = "0.16.56";
        sha256 = "08l013kzfxgl1wajr6gfv3l64a7rh6n2x6m329m7crk74ib0sl06";
      }
      
      {
        name = "language-julia";
        publisher = "julialang";
        version = "1.40.1";
        sha256 = "1pw2s8qdgvacrb8bfxz4baszlzkc2frrvgk3n9g30vzfj0kprw84";
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
        version = "0.6.36";
        sha256 = "0fkrjcw3kiggdqd81v03q80mgdv6ykckpi25mcj9jp4vz027dgg3";
      }
      
      {
        name = "mips";
        publisher = "kdarkhan";
        version = "0.1.1";
        sha256 = "076j18a1j3s21cg8c8sq3ka5w8j0445lfxa6ljx6r5gnjzr8mdd9";
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
        version = "1.23.1";
        sha256 = "0gck916yzn09rh863gyaaf2nhjqnv0gqdkzcn1fjy7956sn9w073";
      }
      
      {
        name = "csharp";
        publisher = "ms-dotnettools";
        version = "1.25.2";
        sha256 = "sha256-//bM+v7k9UE2NB0IqPszOgK3dEUbPQS9ayLgDnu1BaA";
      }
      
      {
        name = "dotnet-interactive-vscode";
        publisher = "ms-dotnettools";
        version = "1.0.3611021";
        sha256 = "1lsj08wbhx8l2q2vl3p690dqdlz9n5ip1mvywyl2qshqwrnapid3";
      }
      
      {
        name = "vscode-dotnet-pack";
        publisher = "ms-dotnettools";
        version = "1.0.12";
        sha256 = "1c3h05lhi5ylhrg776j49aqgsq651xs6q9y87x24lbwwv657zfpq";
      }
      
      {
        name = "vscode-pylance";
        publisher = "ms-python";
        version = "2022.12.21";
        sha256 = "00klks2jvjgsd96pqdx28vxw5ny26idlbn6phnwlisx4rssp1kdl";
      }
      
      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2023.1.1003441034";
        sha256 = "1h20b8i480gp1f673n8acw52ba2w2j4j2kag9bppnvpnccam293a";
      }
      
      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.267.0";
        sha256 = "10rfx8mmv0ji8fksyyx05rxw5485l7ngckp6qwp6g5ig9dsc6nc2";
      }
      
      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.94.0";
        sha256 = "1rvxk08rh9j0r4igbivbqyccqaldag1349af2i958d40lpy5nlfn";
      }
      
      {
        name = "azure-account";
        publisher = "ms-vscode";
        version = "0.11.2";
        sha256 = "01mhw6nv63wj1l2p7jfxim4v691xdf5cww8r82cwq0n3dhsvih1a";
      }
      
      {
        name = "cmake-tools";
        publisher = "ms-vscode";
        version = "1.13.28";
        sha256 = "1m357xgyxrwqs8361h3jf86wbca1padw8v6hsbkwh7zh47bb1iwv";
      }
      
      {
        name = "hexeditor";
        publisher = "ms-vscode";
        version = "1.9.9";
        sha256 = "0w7b9llgm6plzpkr5g8ikpyxdgfdjcd5v9xzhp6967j0xphisdbb";
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
        version = "1.0.5788";
        sha256 = "1yg1dx8gi3xxayscnij4ckx1jjc170zb7v17280pq7hkp6k2d384";
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
        version = "1.14.2022121003";
        sha256 = "sha256-ve2pgJI84j+gcRAsUbh4lSE9/lksHUK7V3gpVG6cwSQ=";
      }
      
      {
        name = "r";
        publisher = "REditorSupport";
        version = "2.7.0";
        sha256 = "09bq6cq1qszl38pairr3f9xrw1igkimsdagbsc4v54r0qpmmfniq";
      }
      
      {
        name = "rust-analyzer";
        publisher = "rust-lang";
        version = "0.4.1316";
        sha256 = "sha256-y7bRvBUBHl5k9zMS563DxgJAx+VtO72jCOgIQ20qDaE=";
      }
      
      {
        name = "jinjahtml";
        publisher = "samuelcolvin";
        version = "0.19.0";
        sha256 = "0zmqbzmafgr9fv434vmgwlrs45a4jd2wr9zwc4nkqj106kr2rxsa";
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
        version = "0.47.2022112823";
        sha256 = "0nlkkpc2v755g39lcb5bhx207b0kjn44q539w07al9b021y2vq54";
      }
      
      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.25.2022112900";
        sha256 = "0rgassar7f3xbdq23i5vr69pqi72fmcc61y93wgk5pnxrms1k3qd";
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
        version = "0.40.2022121203";
        sha256 = "1ilycsc6i0dyydirdwmglq90l81cxn9pi977vhy8g16w5f7f62l0";
      }
      
      {
        name = "vscode-wakatime";
        publisher = "WakaTime";
        version = "22.1.0";
        sha256 = "17jbcwc89609ki1q6zpbyqwwd5700i6407241kpjajk7gbxra8gd";
      }      
    ];
  };
}
