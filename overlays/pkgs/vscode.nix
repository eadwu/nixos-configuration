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
        version = "0.6.0";
        sha256 = "1lrj4ka1wh1fkb06rdky6l9mna7xfy1ngzm8faxk4av7m0bm2c51";
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
        version = "2022.10.2205";
        sha256 = "0d47hz6w9r61d0qpqami6xf90vjgjzq4kif89x58l5a2x8vjhidf";
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
        version = "1.54.7077";
        sha256 = "1cfs91sv3c3k75863n3gwyzb6nfajj0vcp97bm0k55lcjaj40013";
      }
      
      {
        name = "vscode-pull-request-github";
        publisher = "GitHub";
        version = "0.53.2022102118";
        sha256 = "0dvhbfm8mikd01fmghqbmj4swbjs3cz1nsdwjs2k07xcbn5fmk62";
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
        version = "0.0.219";
        sha256 = "1inbfi3mlsqkkgsp44qkj80hb87f44g23cahl5pjh8985hapcpw5";
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
        version = "1.16.1";
        sha256 = "06rzp54qqln14ywcdc1yzlrg6jbzfrzd0rbqbb9gpk2vwn4qjksb";
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
        version = "0.16.55";
        sha256 = "06rf1hv0226qql899zqg1ccnf8sgi208k9s2hrirshwmz16lk2rx";
      }
      
      {
        name = "language-julia";
        publisher = "julialang";
        version = "1.38.2";
        sha256 = "1aaspv7zkmxwwqmxnskxw3vvjr4fr3vssgpjbyddkpw5ixscif07";
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
        version = "0.6.33";
        sha256 = "0cbnyx2ynr3azsidnriksccg51jx79nnqipf48nv9447w6aazfma";
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
        version = "1.22.2";
        sha256 = "13scns5iazzsjx8rli311ym2z8i8f4nvbcd5w8hqj5z0rzsds6xi";
      }
      
      {
        name = "vscode-pylance";
        publisher = "ms-python";
        version = "2022.10.31";
        sha256 = "1k2f4y8nk8is5wy6iixcydkfc7wxrgvwdqi381nlcrnlxxh4wifg";
      }
      
      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2022.10.1102961034";
        sha256 = "0965vv4y6ppn59ggrbcbyqi298hd9n5q8lgixc3ykwj9hry7425s";
      }
      
      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.260.0";
        sha256 = "1gpqcv4hmd6sy8vny7s3cb2i958mrc1vjc0m1hfgw46bswsk8xij";
      }
      
      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.90.1";
        sha256 = "19lrw5107d1ji80g6pm98213gfsryg6qdl5y5f360dny31p38pn4";
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
        version = "1.13.17";
        sha256 = "0cshpvdy8aiawaj9rjb5va8ls0mgm64ijfix138ifq77fm60lpj4";
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
        version = "1.0.5739";
        sha256 = "0hp3fb33qzv3mz16wr3pr0yfn82myvwbzdiiw365nnvi1awma50a";
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
        version = "1.12.2022102204";
        sha256 = "sha256-qNgrygnL1GIZ1aBlnlJyu4g74wkmzBPFUFVzH+ta8YU=";
      }
      
      {
        name = "r";
        publisher = "REditorSupport";
        version = "2.6.0";
        sha256 = "1ab5d8c1bw8dbynzfl7vdgh299nc7d8x0mpi022lyqm7jq4n65xv";
      }
      
      {
        name = "rust-analyzer";
        publisher = "rust-lang";
        version = "0.4.1257";
        sha256 = "sha256-C6G/85UA5OvTl7Fs7Yzb1P6ZBSH0EMBzuuSZnVujCOo=";
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
        version = "0.45.2022101323";
        sha256 = "0lhkbpdpmykmy68d1sd3q4a23w0ms70yp24wfnbb2bm83dmzgm0a";
      }
      
      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.25.2022092912";
        sha256 = "0a1azbdaj6dr7lxmpa12s0wr30isj4aj0fhd8m9cxkrr93hk43i5";
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
        version = "0.39.2022101303";
        sha256 = "1grbr0xf19c0a3gx8053mya9v2yfgk27n1wxhdgasgx5vj8v4glh";
      }
      
      {
        name = "vscode-wakatime";
        publisher = "WakaTime";
        version = "20.0.0";
        sha256 = "1d7nzn84p27rdfsx1hlmvfknbq0hcqn7gnzcphdmb5krd7qshhsh";
      }
    ];
  };
}
