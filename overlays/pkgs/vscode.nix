final: prev:

with final.pkgs; {
  vscode-insiders-with-extensions = prev.vscode-insiders-with-extensions.override {
    vscodeExtensions = with vscode-extensions; [
      # ms-python.python
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
        version = "2.8.4";
        sha256 = "1729ij89hsdmpij4hcpd3gmdakx6iqdcnqbqajqhjfs769r5hh0l";
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
        version = "2.3.5";
        sha256 = "0irz24wbr96km0z4asddk43g7siqqz6nf1dx3gzavd3ryngly866";
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
        version = "2023.2.304";
        sha256 = "1is0mfxl2qyf00i5p80nh6bfaz0a0sa4gvdr32fjbizgnz9465k8";
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
        version = "1.71.8269";
        sha256 = "1f1mfvhwc3y7v2196fl1k8zjh164axqarmm5k9nafxz2sda79lvf";
      }
      
      {
        name = "vscode-pull-request-github";
        publisher = "GitHub";
        version = "0.59.2023020215";
        sha256 = "035ggakcha63wflvkc62vifvbidw74sh6np3fmf0vv6dv3pyh77w";
      }
      
      {
        name = "go";
        publisher = "golang";
        version = "0.37.1";
        sha256 = "0z81mi7x3w1pd4n7prnzm3dy05s2fx8crkc7il60k0qw95aqrs64";
      }
      
      {
        name = "todo-tree";
        publisher = "Gruntfuggly";
        version = "0.0.223";
        sha256 = "0nm5ywbmq943dbdjix8i4pcr5pily9850rqwabzrvalnzgfjqsc5";
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
        version = "7.4.1";
        sha256 = "03rwm6j8x9n6sg7k04pw0i8ryvi286zr7l5pias2vb5vl99x934k";
      }
      
      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "9.6.1";
        sha256 = "07m42pc1ml29bg93s2w7pimg9a55zpyvhpkx5s5a7yga5j36vr8l";
      }
      
      {
        name = "better-cpp-syntax";
        publisher = "jeff-hykin";
        version = "1.17.4";
        sha256 = "1zn4n4hjplz0p3bbbiliw9bnca69b0cg5h31k9rilnycvbc2c7kf";
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
        version = "0.16.57";
        sha256 = "1c3xas5w44mgvb98qgwbizf3dfkr8p3zgjl7rd5nw0r5nxfx6ax3";
      }
      
      {
        name = "language-julia";
        publisher = "julialang";
        version = "1.41.1";
        sha256 = "186lrckvzkyqvxmzi7yi9rhx5523rhah95ra3by049lsr9hkzzw7";
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
        version = "1.23.3";
        sha256 = "05lxa03hh5rslg7351dw87zlrp4drqy1jmpms1aml0yn1jxfb9yj";
      }
      
      {
        name = "csharp";
        publisher = "ms-dotnettools";
        version = "1.25.4";
        sha256 = "0nrq9dmvdjhlj1gnxhb07kzc3s1zhg48k1yf9h5v6bhk9fwd6di5";
      }
      
      {
        name = "dotnet-interactive-vscode";
        publisher = "ms-dotnettools";
        version = "1.0.4104011";
        sha256 = "1xgi6mza1cr4gcsrskrfbbr6hfwzjkp02fgzi8ncq9viib672637";
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
        version = "2023.2.12";
        sha256 = "12i3jkaznbg5gwfrjv1brg7hj487r1q9hwhwmpvw348sfpv5qid9";
      }
      
      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2023.2.1000360234";
        sha256 = "0a06rzjizr8h1vyczvk1aysparf0xhk70iw86i49f6pw72pa52wn";
      }
      
      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.276.0";
        sha256 = "1973x9r4k2b8919wzpash17c58csv2d6k953szfk3gcrvx8xdffq";
      }
      
      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.97.2023020215";
        sha256 = "0iy0s4whm19r59a5x03phk71ryf9arbmpi5qasa44ymnhhhl1a4w";
      }
      
      {
        name = "azure-account";
        publisher = "ms-vscode";
        version = "0.11.3";
        sha256 = "1kd0j9iysnqjws05kg14mfjbgm6ihkpk6yxl4sk4qdhm3ig3hi5i";
      }
      
      {
        name = "cmake-tools";
        publisher = "ms-vscode";
        version = "1.14.6";
        sha256 = "1cip4250332ywipvbd9h6xqrr861n22ri7acw00i7ximvghvnf49";
      }
      
      {
        name = "hexeditor";
        publisher = "ms-vscode";
        version = "1.9.11";
        sha256 = "0annfim67kmc0fxd8ap00z5sv7hwwp5q2rlxm0n1099znk7pqm63";
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
        version = "1.0.5828";
        sha256 = "1myk9njk2l3r989vf6m1x7ff0ygkrpkf2i5h2ba3zczp4sp8fh6d";
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
        version = "1.15.2023020403";
        sha256 = "sha256-N1bJN0touSAGFQsCcB0DY8BY0ALGdnPaPcNG1uG6Fcs=";
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
        version = "0.4.1393";
        sha256 = "sha256-ulz9DFrQBWe3G71XpvHzkG9TFmw/WsvUksCZbsP6vvM=";
      }
      
      {
        name = "jinjahtml";
        publisher = "samuelcolvin";
        version = "0.20.0";
        sha256 = "14xam64dfhcq3mckw2s9bg58miw1v2jqfg1ays6ksz8b17fcn060";
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
        version = "0.48.0";
        sha256 = "0mj4x1746fs20zzlc2ahmrk65vpxxq1fqqb405d46567r1jbn7kc";
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
        version = "0.37.2023013002";
        sha256 = "0hk96m45x6gyp63b1yfzr6r9g68c4avqm9ivrwz1gczwf18c60h0";
      }
      
      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.40.2023020103";
        sha256 = "1dgagzk61i5v6wby673x3wsdm8v803lrifwlpy8dnsmz97gasjvl";
      }
      
      {
        name = "vscode-wakatime";
        publisher = "WakaTime";
        version = "24.0.4";
        sha256 = "0sd57dbga5gb6dznn0jf32rfxpzs2i5cqx6q4iviwlfha0gdsq6a";
      }
    ];
  };
}
