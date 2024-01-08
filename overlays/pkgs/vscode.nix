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
        version = "0.8.0";
        sha256 = "1bvvl5r5z8w6604s9lklxrj51mlhzw6vbdppg3y5q25sbaqwfyql";
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
        version = "2024.1.604";
        sha256 = "08pcfh6lslr18pnjghfnqh01hy2b9i93hgdjhxqiwiwllpd9ns5r";
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
        version = "3.3.1";
        sha256 = "1irnc0gvjlpigjzxci53af6n9b36dwq466h18cpv54ziw0gnn98j";
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
        version = "1.145.636";
        sha256 = "1fpy19j12p83gwgk970db8k09hgm4iy085vsjzvl538gzvgsb91a";
      }

      {
        name = "vscode-pull-request-github";
        publisher = "github";
        version = "0.79.2023122012";
        sha256 = "0xai6yk4chr76v5xwbw5p1jcr2wl9cjw0sy6sg57q7xamm8ypy73";
      }

      {
        name = "go";
        publisher = "golang";
        version = "0.40.1";
        sha256 = "0844kxbi7qi79wal0cqcd4wiygc42fyhamn33lsx2ms4yj5jxri9";
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
        version = "2.5.1";
        sha256 = "1gy2s9pzwsiwjk2b3sqn9hp3zbcg1jxbf4zl9hcqan3q6v96m7dz";
      }

      {
        name = "ionide-fsharp";
        publisher = "ionide";
        version = "7.16.1";
        sha256 = "1aavbsficw6abjlmxdmbb77hhgdxwrrqp613s0r2jm2mljxmkakf";
      }

      {
        name = "latex-workshop";
        publisher = "james-yu";
        version = "9.17.0";
        sha256 = "1688y28izz6z8ck3nlnlcf4dr3ipxw1fvzzsl3qjx9yzviy1aadv";
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
        version = "1.65.2";
        sha256 = "1zh6km33g5a9n6h63wnmr4j78hgiajbbbc9wcfs0xkh9ivs2s409";
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
        version = "0.6.55";
        sha256 = "1bbqidh9ydhpk5nscba2igs1349rlkw4zb24c9q7h8qan0i99kar";
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
        version = "2.14.8";
        sha256 = "0d345y1gvxxrx98mz5rqkwhsmabl96y6b94y6prcq9c9vki5gcb8";
      }

      {
        name = "dotnet-interactive-vscode";
        publisher = "ms-dotnettools";
        version = "1.0.5054021";
        sha256 = "1nga0nbkcl9phk2sqa7nb85725lw6qsifk24kld6ppkrf8yr4m0y";
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
        version = "2023.12.102";
        sha256 = "0n7ki321qy9vqhdafyqn4pakqdyl0kxclrh21rnmyl4x47q8kj83";
      }

      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2024.1.2024010501";
        sha256 = "1gzkb1hh46ami38vzn3ffcmdywf3b5xj2fcgpk5f9gxy4yr0d7zj";
      }

      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.329.0";
        sha256 = "1y2r34dc48aj55b5nhdj58qkbvgipcdaiv00vp2q154rmlwx7lz9";
      }

      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.108.2024010515";
        sha256 = "1dghvndmczhapam72qifh0g5msm5x4zfx4bksm4fv36y7ggrcdx2";
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
        version = "1.0.5900";
        sha256 = "1nwpqda60b5wlsxvrc3y7drybk8qyglnk6c3hdir59mnlkymc9dk";
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
        version = "1.26.2024010508";
        sha256 = "sha256-7CA2rAqiRyic1cPe573wYqVV3iQl92t13lT13z/S7mQ=";
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
        version = "0.4.1798";
        sha256 = "174sd67qx3cc7c3sl5ynp2530hgwh58yj5564xn028h7n6y4336n";
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
        version = "0.6.3";
        sha256 = "1rgbxfh2mg285xjx7imzw7238gcancy4kqwmdjij9pp55l4l2njk";
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
        version = "0.55.2023121302";
        sha256 = "0nhly0gvm6rg8ppfqbgb6vln34qpd98h3kxgsxzag880pgj1ak7j";
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
        version = "0.40.2023122104";
        sha256 = "1nfbrsldlxadf4wskgpy9vr5qqyarg419pczzv7fh3v2wjm2lhr5";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.43.0";
        sha256 = "07bm7q13364zzbfbh6s5p5ll7labn41wdmj5b4dhp03y0fxhk9yi";
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
        version = "0.5.1";
        sha256 = "1m25bbgfv8x8f0ywadjwsmh4myqgp8xwf5yjrkskgr8axj8ny36a";
      }
    ];
  };
}
