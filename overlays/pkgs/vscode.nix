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
        name = "bookmarks";
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
        publisher = "bazelbuild";
        version = "0.9.0";
        sha256 = "05cplm04216kzd1snqabphv81ly9668iay9k776s0vnlkfr6pd2y";
      }

      {
        name = "solargraph";
        publisher = "castwide";
        version = "0.24.1";
        sha256 = "0y9y30jyq49vzwn3wn8r922fnbzqskqa42wcmkv6v8waw0da9pik";
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
        version = "2.4.4";
        sha256 = "1c10n36a3bxwwjgd4vhrf79wg14dm0hxvz9z23pqdyxzcwrar49l";
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
        version = "2024.3.2405";
        sha256 = "0gvrj8bc26frcppisxy6bsmi770gfx8w1f9w7wb3pq5h0k2mynm8";
      }

      {
        name = "vsc-material-theme";
        publisher = "equinusocio";
        version = "34.3.1";
        sha256 = "1qbnqjhzh3cw2ya96szj39r7swg4p7whvhacw1dis9b3rd64ab6z";
      }

      {
        name = "vsc-material-theme-icons";
        publisher = "equinusocio";
        version = "3.5.0";
        sha256 = "0lqipaa3wp74b74hrxyylp1c4y2918l7ciqz53ja6gbcb5jp5asy";
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
        publisher = "github";
        version = "1.175.784";
        sha256 = "1l99k00za82pswa16y9d29dhrdryla7h32lqlggqwnd14zfcvmcp";
      }

      {
        name = "vscode-pull-request-github";
        publisher = "github";
        version = "0.85.2024032111";
        sha256 = "02vyy02a62h2ph4jzdmynfc0qy3ng0g8818az14w8s3yfzwcihfl";
      }

      {
        name = "go";
        publisher = "golang";
        version = "0.41.2";
        sha256 = "13fdnwgci87x1rdz1hwq52ling81c3l67cqvmckcjzri2r8gsgvq";
      }

      {
        name = "todo-tree";
        publisher = "gruntfuggly";
        version = "0.0.226";
        sha256 = "0yrc9qbdk7zznd823bqs1g6n2i5xrda0f9a7349kknj9wp1mqgqn";
      }

      {
        name = "haskell";
        publisher = "haskell";
        version = "2.5.2";
        sha256 = "09pr3ya77ryj5n80k5srwaxmr0j77f6xp67w0kz324i6fhjd12bq";
      }

      {
        name = "ionide-fsharp";
        publisher = "ionide";
        version = "7.18.2";
        sha256 = "096im30az0jwzid0k2gmvqvvvidkprv0sw94ric9xdk44qp96iq8";
      }

      {
        name = "latex-workshop";
        publisher = "james-yu";
        version = "9.19.1";
        sha256 = "15k0kd12kkgsxgdr8rw3379gbgffdcxw6hb2fzsca9n32bkwym1i";
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
        version = "0.3.1";
        sha256 = "1cpfckh6zg8byi6x1llkdls24w9b0fvxx4qybi9zfcy5gc60r6nk";
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
        version = "1.75.2";
        sha256 = "0gmvmx61k43fm2sgi4cnig2lvfxx6q69szz7yvy3ippj4k1jws60";
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
        version = "0.6.59";
        sha256 = "068hsif9d91wd006zp4wq0zv3rzwjvm0za9wc8jl59h9ql0811m8";
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
        name = "vscode-mojo";
        publisher = "modular-mojotools";
        version = "24.1.1";
        sha256 = "0844x7i6i2a4py6app4cq122ccdy78rwfhb5bpvcv63y1ibcg7dy";
      }

      {
        name = "vscode-docker";
        publisher = "ms-azuretools";
        version = "1.29.0";
        sha256 = "0rz32qwdf7a5hn3nnhxviaf8spwsszfrxmhnbbskspi5r9b6qm4r";
      }

      {
        name = "csharp";
        publisher = "ms-dotnettools";
        version = "2.23.2";
        sha256 = "0ysqwp50z8s2in9mbs401m1a8wjignimm8rj5yz0w7gqh0fzi2bg";
      }

      {
        name = "dotnet-interactive-vscode";
        publisher = "ms-dotnettools";
        version = "1.0.5164011";
        sha256 = "0v8ydar4bbrxwd51jfl92wm4vyl1xkk1jk1v2nsx5qcgs5xznsvh";
      }

      {
        name = "vscode-dotnet-pack";
        publisher = "ms-dotnettools";
        version = "1.0.13";
        sha256 = "0r69h4lwsxgkg8hsqfzq4n786yj5m8lk3zngckfj23c00mg64z6g";
      }

      {
        name = "vscode-pylance";
        publisher = "ms-python";
        version = "2024.3.101";
        sha256 = "1vbh7a47gk7vgkv6vccl7pgwlgr4g2mj1z2zxj03g5ma6nm316bz";
      }

      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2024.3.2024032201";
        sha256 = "1cf28qfzrqvih1x600nlgk5v0r2jqcdgljn6vf10hckgvm2hga3d";
      }

      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.352.0";
        sha256 = "03nl7h4x9lgjlylv26hllk680jjjccdjii4c01gjy8dqq0jhrfbc";
      }

      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.110.2024032215";
        sha256 = "14vpn8d6z24z9cdxpxrlbsqmy87qnlh4vnwd0fk2l5zn3kkh3zdd";
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
        version = "1.17.7";
        sha256 = "0fvq1vkfb8p91y73kykb41ngwxfvak9g3x8nkffrb7gdfi59m9yn";
      }

      {
        name = "hexeditor";
        publisher = "ms-vscode";
        version = "1.9.14";
        sha256 = "0fncakv8v8p1rhka5dvh87kc0vsfaxg1s48blwhv7r6fyw70b9jm";
      }

      {
        name = "live-server";
        publisher = "ms-vscode";
        version = "0.5.2024010901";
        sha256 = "104v2c3nyach1apdqzakcw8vs8aly7x9f9ml5ddr03w8a81qa8z8";
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
        version = "1.0.5918";
        sha256 = "1m4mpy6irj3vzjw6mzmjjp6appgf000zfhmkjwxw65sl4wmjckaf";
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
        version = "0.13.0";
        sha256 = "0rp6k8gwnz5wczhqb02bnf1maji3wbr1xhkbjhm32fcr54km88f6";
      }

      {
        name = "explorer-exclude";
        publisher = "peterschmalfeldt";
        version = "1.3.2";
        sha256 = "1khvs655dl0gn69azx1hzv9czli1kc7w18dfwirqkdibf1zxvg07";
      }

      {
        name = "wgsl";
        publisher = "polymeilex";
        version = "0.1.17";
        sha256 = "1320ykimlbxl9jn9rcjqa376n5x28ir3lwg23jxd3h7pp9baysmw";
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
        version = "1.29.2024032308";
        sha256 = "sha256-ZnUHqFenTYcIh6QQijiUNlwFVXjfxqKykxbEx8YSqYw=";
      }

      {
        name = "r";
        publisher = "reditorsupport";
        version = "2.8.2";
        sha256 = "051jxgyqsmwqpl7izp6jgdjsp5j4swhx440pfa8n5rxq6lkgzwhl";
      }

      {
        name = "rust-analyzer";
        publisher = "rust-lang";
        version = "0.4.1895";
        sha256 = "1c1ympp5f8lj7zv5vdkvz0cnsfiazrz2slikabqyx7rxmxlq3hj9";
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
        publisher = "shopify";
        version = "0.6.10";
        sha256 = "1cgqzdhsi1ffdsaz303gnj1ild0ak3jx5yw0947h0784wpqab2d3";
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
        name = "svelte-vscode";
        publisher = "svelte";
        version = "108.3.3";
        sha256 = "0an2jc29zsfxav0i32l069qfhbblhdy4dyvvszz90bn1zh63rg5b";
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
        version = "3.16.0";
        sha256 = "0p0ha65ry0ab8l4fqyys225jync64cax068j7m84qbnqk81kywv3";
      }

      {
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.56.2024032202";
        sha256 = "06wwf8dm88fj8qc1ppmxfgx49ax1j4bdc016jn4r9adr7jgrh4sm";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.25.2023121402";
        sha256 = "04vv88lmn4fs3gk84nyxcc0r5ay1pmzs59wwfrx78yqrd0mlj596";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.40.2024030709";
        sha256 = "1y6kh35spjwxlwja70mzbf1740727fnzi37la86d2x4aashw49q6";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.44.2024013105";
        sha256 = "0fpfr1g6dfrrrdc4i8q19xzx5rqd0irpsba2qhipx08kjr3z57iv";
      }

      {
        name = "vscode-wakatime";
        publisher = "wakatime";
        version = "24.4.0";
        sha256 = "0fbh432pz54p0pammddn7d2vwbb44klxapymgmcblwmbdjy1ghz2";
      }

      {
        name = "vscode-zig";
        publisher = "ziglang";
        version = "0.5.4";
        sha256 = "1811c738z0n42chaalw0p8rjx4micn728m6vljk27v1qdxbf9k4i";
      }
    ];
  };
}
