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
        version = "0.8.1";
        sha256 = "0cb8y76iwmwvnzblmlbihhq30pz6d4vzmj3mnm4k11gv5qb5pcam";
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
        version = "2024.2.1804";
        sha256 = "09rhh6mahav8250y0v3w7nwn3nnkbh46xlsgimd0hs7smzqif6yn";
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
        version = "3.4.0";
        sha256 = "1q2s2ys2xxb5nk0knmyxvdg1rpy4z0x4lanwmh2bhca99y64ls59";
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
        version = "1.162.714";
        sha256 = "0xrpm0y4yhjlg3vc5shv1hg36drwbzixlc74mddkgpcpd774mxx8";
      }

      {
        name = "vscode-pull-request-github";
        publisher = "github";
        version = "0.81.2024021509";
        sha256 = "1pl97cz3lcnkf7cyyy4w8aqa7lynbnf2hac2bxf4f7ffj81azx8f";
      }

      {
        name = "go";
        publisher = "golang";
        version = "0.41.0";
        sha256 = "0b1f0y4326jshhn2yq50wqvhf4bxcjri4i73myhv57pipbcxd2lk";
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
        version = "7.18.1";
        sha256 = "05ajhpq1rp1c53fr2vyc8p6r4fxfvanglp0ynxc1cri8fx1crlz8";
      }

      {
        name = "latex-workshop";
        publisher = "james-yu";
        version = "9.18.2";
        sha256 = "1bzzrq8bd73gjs8jrqnwqil6hd6bs6zbbrv35ngz31hx7wsgkw1s";
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
        version = "1.71.1";
        sha256 = "1fm2mrgh69x7irkd9n0iivmksdipgxhdnvwyzkb579n9zndzanfx";
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
        name = "vscode-docker";
        publisher = "ms-azuretools";
        version = "1.29.0";
        sha256 = "0rz32qwdf7a5hn3nnhxviaf8spwsszfrxmhnbbskspi5r9b6qm4r";
      }

      {
        name = "csharp";
        publisher = "ms-dotnettools";
        version = "2.18.15";
        sha256 = "1y6pp04536003h4qcvwa3zcykyj0zk2bf0rdvg4vdxycglxjh1qc";
      }

      {
        name = "dotnet-interactive-vscode";
        publisher = "ms-dotnettools";
        version = "1.0.5115021";
        sha256 = "17dk2rdpaafvf0r2sr4w13a5f5ygh4apxccvifwq96y6f9wghy20";
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
        version = "2024.2.101";
        sha256 = "0g6swds84qbrj3xjkhpm6wdl87hhysmxwp1n87gm4d90bn3rj3pq";
      }

      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2024.2.2024021201";
        sha256 = "0xy2265rvcwjhrzlc26rvgd6qqx3ycbh0mh3y685x3v5nb7v02vj";
      }

      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.345.0";
        sha256 = "0qnbnddhb4yisc3xbv2wsbcfzfn2dcxjhd5kgwdksvcqkrnmwqb5";
      }

      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.109.2024021615";
        sha256 = "0qkgc95ckgs05yhhjv9idq3nw59nh2g5hqdrbqsb45bbmgffdzf0";
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
        version = "1.18.1";
        sha256 = "11rzs5vkph9x46q34kzdnhi7hjzmrjiyin9kc279swia9brkyzb7";
      }

      {
        name = "hexeditor";
        publisher = "ms-vscode";
        version = "1.9.13";
        sha256 = "0vwvn9n83vgg2nq05inb71m3afhcqw9i2z2zj6llh0y6y7w6bxfa";
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
        version = "1.0.5905";
        sha256 = "0xixyjlw45fg8mi0f3h2kn9x24qhvvmaah8p7syqdzyxlwxhqlyb";
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
        version = "0.12.1";
        sha256 = "0d13l2ca730czd80pwdigy0y3srssdm19hx81qn9jv5m7w5dh9fm";
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
        version = "1.29.2024021608";
        sha256 = "0jfddcbhc7ian1hkvfdblj8sf4xr1s6skdxdha13f47ivx65sazw";
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
        version = "0.4.1843";
        sha256 = "0glcys2dj2avmh34brm1wyzcsljiggjayv4dnd8csrhcq7096v77";
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
        version = "0.56.2024020601";
        sha256 = "0706h1mlsmxc4hq3pg6vvswgznqp5slsx8mfnvbmhb273y10lnbz";
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
        version = "0.40.2024011806";
        sha256 = "1fnr8r9z2jz7gabc677zrhvdzqhlrrasnzlr2ralgq9pi3vpwyfa";
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
        version = "0.5.3";
        sha256 = "038vlqyyfi1fmsksgxck0y4g6vsi7m4qg209hsw9lfi6biyh78qp";
      }
    ];
  };
}
