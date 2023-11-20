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
        version = "13.4.2";
        sha256 = "14wx92fgsj170lxhq81dc4hcs4rjkmagxzmwsqgayqv4360mkv9v";
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
        version = "2.8.5";
        sha256 = "1ndffv1m4ayiija1l42m28si44vx9y6x47zpxzqv2j4jj7ga1n5z";
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
        version = "2.4.2";
        sha256 = "1g5mavks3m4fnn7wav659rdnd9f3lp7r96g8niad4g1vaj4xm23q";
      }

      {
        name = "githistory";
        publisher = "donjayamanne";
        version = "0.6.20";
        sha256 = "0x9q7sh5l1frpvfss32ypxk03d73v9npnqxif4fjwcfwvx5mhiww";
      }

      {
        name = "gitlens";
        publisher = "eamodio";
        version = "2023.11.1804";
        sha256 = "0gi8czbz3cyrs740g53lsbwp7a5fqjfw4gsx09rmqlfbl888s1zz";
      }

      {
        name = "vsc-material-theme";
        publisher = "Equinusocio";
        version = "33.10.5";
        sha256 = "156mjsg6fv8l98h9c8bh2fiy15vwc88b9xpzmg55892jh3r85mbz";
      }

      {
        name = "vsc-material-theme-icons";
        publisher = "equinusocio";
        version = "3.1.4";
        sha256 = "1qnjw5hr68kidqj50p2spmbpgz4hqb5v99cra1h18lav4mfjpr7p";
      }

      {
        name = "yuck";
        publisher = "eww-yuck";
        version = "0.0.3";
        sha256 = "1hxdxa13s1vlilw7fidr8vnl19c9wjazjvnvmqgl4fsswwny110c";
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
        version = "1.137.557";
        sha256 = "01qcbq574idk46ckngqg9dzxh78gvkl3srjzxgz0qlfzwlnfxplh";
      }

      {
        name = "vscode-pull-request-github";
        publisher = "GitHub";
        version = "0.77.2023111713";
        sha256 = "1mpb90i99745qbqk41w9xmyl8mpznbm3g74j65vxgd6svdxf6k81";
      }

      {
        name = "go";
        publisher = "golang";
        version = "0.40.0";
        sha256 = "1k2zv49pam436cgvb970dc9n4xpdkd07lp8jllrsx5vnx7m2ml52";
      }

      {
        name = "todo-tree";
        publisher = "Gruntfuggly";
        version = "0.0.226";
        sha256 = "0yrc9qbdk7zznd823bqs1g6n2i5xrda0f9a7349kknj9wp1mqgqn";
      }

      {
        name = "haskell";
        publisher = "haskell";
        version = "2.5.0";
        sha256 = "1dnqw3mkzdfqaqy11ygl3cwnfjm30k5dazldl4pqgb7mw11n32as";
      }

      {
        name = "Ionide-fsharp";
        publisher = "Ionide";
        version = "7.16.1";
        sha256 = "1aavbsficw6abjlmxdmbb77hhgdxwrrqp613s0r2jm2mljxmkakf";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "9.15.0";
        sha256 = "0jr9b6f5l361v33z0glci0az9wl259c4vg6qmpqrw7cbsnh5hs5a";
      }

      {
        name = "better-cpp-syntax";
        publisher = "jeff-hykin";
        version = "1.21.1";
        sha256 = "13k0jj4jasq6z4ip9rvzx0g5rkg2fx5p3vl1vnfy3b0v1lz6pryb";
      }

      {
        name = "nix-ide";
        publisher = "jnoortheen";
        version = "0.2.2";
        sha256 = "1264027sjh9a112si0y0p3pk3y36shj5b4qkpsj207z7lbxqq0wg";
      }

      {
        name = "lean";
        publisher = "jroesch";
        version = "0.16.58";
        sha256 = "0v9lg4lx4yrrk9ziqgnwvajbdyfnr5j7x8p8qiwfp98ws3lq57vv";
      }

      {
        name = "language-julia";
        publisher = "julialang";
        version = "1.60.2";
        sha256 = "1iai6s1594wxj3fqzbq18pwabv8mkjs9b707a6g5112v77yxcyv8";
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
        version = "0.6.48";
        sha256 = "1wbffba9mwyi7s70k46hbzzp0vni1ndpnvyfcwy156l7l8s047kw";
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
        version = "10.43.1";
        sha256 = "0vxwwcg4nw0lxj28qnk6z5swd546gk5f6zqzsnk1mxhaschyv82b";
      }

      {
        name = "vscode-language-babel";
        publisher = "mgmcdermott";
        version = "0.0.40";
        sha256 = "18pr0jg62ddb23b6pfq5fxr9mff2ylhw46apcd5616km0122swr5";
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
        version = "1.28.0";
        sha256 = "0nmc3pdgxpmr6k2ksdczkv9bbwszncfczik0xjympqnd2k0ra9h0";
      }

      {
        name = "csharp";
        publisher = "ms-dotnettools";
        version = "2.10.28";
        sha256 = "073hbd179icgapnw29ik47wmgysgis51q727cm78s6q38ndg05sz";
      }

      {
        name = "dotnet-interactive-vscode";
        publisher = "ms-dotnettools";
        version = "1.0.4562011";
        sha256 = "1gyn8vaa1na3dfhvrwvqrg19jkfhss4flp41lfy9hkqbqmk1nr40";
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
        version = "2023.11.13";
        sha256 = "1ayy4pp983j8fwgjffv0cy39anhl2ai1n4a4c84ngj0si18y7k0a";
      }

      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2023.11.1003211000";
        sha256 = "0wmz7lla148s14izl1bfpdcn7nf5lpzca89gqrjsirvm6m3jclma";
      }

      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.324.0";
        sha256 = "17ln8c618d3l79n75mn3ymjpkg0p0a80gjjdc1qdl8h68zdab490";
      }

      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.108.2023110315";
        sha256 = "0xa5n4mxn03ahw12i7w91r8a51ci37mhibfrpfp5l73blrzr6l8g";
      }

      {
        name = "azure-account";
        publisher = "ms-vscode";
        version = "0.11.6";
        sha256 = "00kbq6iphmqpqj11m5142bzgrvc58h91fakh43vi47jr391nbf3c";
      }

      {
        name = "cmake-tools";
        publisher = "ms-vscode";
        version = "1.17.1";
        sha256 = "0mlfc4wppn9ml3wsg7bg74cg73rshpnqarbv3x4p1k30z8qdsq44";
      }

      {
        name = "hexeditor";
        publisher = "ms-vscode";
        version = "1.9.12";
        sha256 = "0m8g3bd9gk0n3wcqy5w3kjz0sr06q0i88m7z8fkx52x9nla75lkf";
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
        version = "1.0.5892";
        sha256 = "0c4xvs96ccih47l76r6l5bkjfhgiair90yy8syibdq3zshw0kxvv";
      }

      {
        name = "gremlins";
        publisher = "nhoizey";
        version = "0.26.0";
        sha256 = "1sfs98nxm5ylcjrmylr5y68ddml8cfg1q1wdm7wvhfhjqx4kig9h";
      }

      {
        name = "typst-lsp";
        publisher = "nvarner";
        version = "0.11.0";
        sha256 = "sha256-fs+CBg3FwzTn608dm9EvfF2UrI2Sa5hsm0OK/WQyy6o=";
      }

      {
        name = "explorer-exclude";
        publisher = "PeterSchmalfeldt";
        version = "1.3.2";
        sha256 = "1khvs655dl0gn69azx1hzv9czli1kc7w18dfwirqkdibf1zxvg07";
      }

      {
        name = "wgsl";
        publisher = "PolyMeilex";
        version = "0.1.16";
        sha256 = "1fb4vqp5l1qgvhpgasivar05p71kcgkka4xy0y87gfvw8griaiyh";
      }

      {
        name = "quicktype";
        publisher = "quicktype";
        version = "12.0.46";
        sha256 = "0mzn1favvrzqcigr74gmy167qak5saskhwcvhf7f00z7x0378dim";
      }

      {
        name = "java";
        publisher = "redhat";
        version = "1.25.2023111803";
        sha256 = "sha256-4/ip7eWtDWOpdc5lw91oyAiky3ZZk2EPRBKuS7hGfTU=";
      }

      {
        name = "r";
        publisher = "REditorSupport";
        version = "2.8.2";
        sha256 = "051jxgyqsmwqpl7izp6jgdjsp5j4swhx440pfa8n5rxq6lkgzwhl";
      }

      {
        name = "rust-analyzer";
        publisher = "rust-lang";
        version = "0.4.1739";
        sha256 = "1dvi2n4yizpj8sj7lqayhjfk2cpl4y6divlj7gq5vzakc109s9zr";
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
        version = "0.5.7";
        sha256 = "0zkyrhgkm3q1zbzjz5yj85gkabwa3v9pd4xq9ym3ryvn1992ncvj";
      }

      {
        name = "ruby-lsp";
        publisher = "Shopify";
        version = "0.5.0";
        sha256 = "0m6yx85pnn7qmsb6461rx2gvrrsqqq9lbqmgcjkf0rnhdzkfq7av";
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
        version = "1.3.0";
        sha256 = "1q1idvpqnzlp186kymq2h407hqnhzngxs8n414p13j0svpcrm016";
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
        version = "3.15.0";
        sha256 = "0jj4mac4xqzdx0f6n9az1rh8wclbph95nnny7f4yak59yjigh3fv";
      }

      {
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.55.0";
        sha256 = "1y1cc2if9drv297f0k8qhqmss9gmbkqvwcynq1ajdqwj5ldsh0ll";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.25.2023110908";
        sha256 = "0bzl5kn043p3q62h1jflm03r1hhaz2q1qsyv06g6qcdsd6yiwiyi";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.40.2023101002";
        sha256 = "0dlp2cfhxy0h0kh83g5qz1m9c4djssm83s64g75zd363hkcqjgs0";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.43.0";
        sha256 = "07bm7q13364zzbfbh6s5p5ll7labn41wdmj5b4dhp03y0fxhk9yi";
      }

      {
        name = "vscode-wakatime";
        publisher = "WakaTime";
        version = "24.4.0";
        sha256 = "0fbh432pz54p0pammddn7d2vwbb44klxapymgmcblwmbdjy1ghz2";
      }

      {
        name = "vscode-zig";
        publisher = "ziglang";
        version = "0.5.1";
        sha256 = "1m25bbgfv8x8f0ywadjwsmh4myqgp8xwf5yjrkskgr8axj8ny36a";
      }
    ];
  };
}
