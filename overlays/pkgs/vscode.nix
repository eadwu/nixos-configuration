final: prev:

with final.pkgs; {
  vscode-insiders-with-extensions = prev.vscode-insiders-with-extensions.override {
    vscodeExtensions = with vscode-extensions; [
      ms-python.python
      ms-toolsai.jupyter
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
        version = "13.5.0";
        sha256 = "06pmlmd3wahplhv5r8jdk19xlv2rmhiggmmw6s30pnys2bj5va50";
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
        version = "0.10.0";
        sha256 = "1fxid7g6rb9x6y68g76kzcjcdnjlifxdzd0cgiyhnzi6qp70w9gi";
      }

      {
        name = "solargraph";
        publisher = "castwide";
        version = "0.24.1";
        sha256 = "0y9y30jyq49vzwn3wn8r922fnbzqskqa42wcmkv6v8waw0da9pik";
      }

      {
        name = "ruff";
        publisher = "charliermarsh";
        version = "2024.21.11161840";
        sha256 = "1h87yp007b09w5sd9dl2xiwsqbhqamja8ik49gyxd3hx0xd503yz";
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
        version = "3.0.5";
        sha256 = "1cmkgi1i5c7qkrr8cif36i803yl6mrv87y9gmzfb701pcfg8yxx9";
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
        version = "2024.4.2705";
        sha256 = "1cd5bi1lzns10qmnr2h7pgs0xw9wijq34rrh7zx5ixn4qgbn8dfb";
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
        version = "3.6.0";
        sha256 = "19s6cbgs9xj2gn8g872pzwihjkibwq3abi5cq0qxbb0f3v6p1r8w";
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
        version = "1.184.844";
        sha256 = "0gxv0f9vhyy18q690hnajikrzfrzrszn441mcg4h2pqr0rhnclbd";
      }

      {
        name = "vscode-pull-request-github";
        publisher = "github";
        version = "0.87.2024042613";
        sha256 = "1gldhj6p0824r4sdg4wsqyb5wiswgb9wyx8rvr6wvzvp6zhbk8k4";
      }

      {
        name = "go";
        publisher = "golang";
        version = "0.41.4";
        sha256 = "03gxgcvjk5plzkk7gjsrrck1kszzbzswkbcr33m3qlkyz4iw9nly";
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
        version = "7.19.1";
        sha256 = "0lvnah6kpds9adzj0yhsisrvbd448nxcfvw3x7q4a81lmpgas8a3";
      }

      {
        name = "latex-workshop";
        publisher = "james-yu";
        version = "9.20.0";
        sha256 = "140pyh5alx8nawnqg4bsj2x8hmffywn5v08zq09mm0asbds3ghf5";
      }

      {
        name = "better-cpp-syntax";
        publisher = "jeff-hykin";
        version = "1.21.4";
        sha256 = "0l3ncf585p7bjjvzx82zmnns5z925sf986xs9kgi7sn2f6575a6p";
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
        version = "1.76.2";
        sha256 = "1m2cq0mjpxm3x3s79f3njh1gvrgv03bgmmavfnrflmp4crn9bb22";
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
        version = "0.6.61";
        sha256 = "10zayxkrmajk12qajggixv0ssrjlmwr1s58d3mz2wb93kb1gmmdn";
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
        version = "10.43.3";
        sha256 = "0lkkrrcp97pcq2k8brb4bw1gi58bngjxpzk8c2mdhm3pa9dixij4";
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
        version = "24.2.1";
        sha256 = "0iwiish7y5h01xjm00sxnjbs1mln59yvdhvby9z1psj0gc5rqjrj";
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
        version = "2.26.13";
        sha256 = "0mjzlvs41hx995gpcvawnlgsvwv6gzmwba3jzrzshmi1gsq6ipa3";
      }

      {
        name = "dotnet-interactive-vscode";
        publisher = "ms-dotnettools";
        version = "1.0.5208011";
        sha256 = "1c98bvxxxavwpl7dirhyabxbmksnlw5x135c0431dl55vb7p1zxc";
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
        version = "2024.4.104";
        sha256 = "1sym2v479sz2cj58qlza0pfkylnklvfazcx9kcpwlkgpjwq0vwky";
      }

      {
        name = "jupyter-renderers";
        publisher = "ms-toolsai";
        version = "1.0.17";
        sha256 = "1c065s2cllf2x90i174qs2qyzywrlsjkc6agcc9qvdsb426c6r9l";
      }

      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.361.0";
        sha256 = "12rim5w0wla15afks881lxy358ams5ql6pha340c16w14pvygizc";
      }

      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.112.2024042515";
        sha256 = "1c1ba09ckl3h8aawppdj0ysa2rgf31qakphsxjd2nb6xqb28k8xp";
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
        version = "1.18.30";
        sha256 = "034x9381j3q2qj8mdnxn0mf7lqld32sk41lx7isvfmgz8ajy4d18";
      }

      {
        name = "hexeditor";
        publisher = "ms-vscode";
        version = "1.10.0";
        sha256 = "0mlibryaxfilsl61asm9yxz3jz1jpvp8q3r9w0mg4mpa1ajjqd8h";
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
        version = "23.0.156";
        sha256 = "1kprfkgxzvnaviqihslzkrcxppq7psrgzq18gnxjka9rfxhym5lx";
      }

      {
        name = "java";
        publisher = "redhat";
        version = "1.31.2024042608";
        sha256 = "sha256-44OVKefsvWzstqeTl29yzU0kLCCjpPhnfTWoxqlUS4w=";
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
        version = "0.4.1939";
        sha256 = "sha256-B+hIK5Xbpm6XWmIRjV8U5DIhin1cKz8IfyrnHKDBWUA=";
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
        version = "1.4.0";
        sha256 = "0xqfwn0337adp76cfl693z02r6djiswk9fknj3jx5d23hm303i0a";
      }

      {
        name = "svelte-vscode";
        publisher = "svelte";
        version = "108.4.0";
        sha256 = "022cc8nxs3yflqpg3ph6lwwwiv3klqwgsbfa3pl38nl52y3ibldw";
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
        version = "3.17.0";
        sha256 = "12fjvhfx837wv07qf1xh18y5fd220zz10i541jzjnsm4ig6h0h8k";
      }

      {
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.57.2024041008";
        sha256 = "1mx9lchp5c9p4lqa17awn50myjawxnp8smi4316klyqlfrypmmkv";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.26.0";
        sha256 = "1jhpd748y06irwwdxz2xjfdn41hxyi03x8jv4r3fsdkzjamby2a0";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.41.2024042308";
        sha256 = "0idny9zyk06mr4l2f6r2l17xpjkkqa5948l70gf8wl6bgrj91k0d";
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
        version = "24.5.0";
        sha256 = "0sqbwcqy8hlpmy5hdx4hrgh7rg48vc7fg2zljnp63pjc6ng6h48x";
      }

      {
        name = "vscode-zig";
        publisher = "ziglang";
        version = "0.5.7";
        sha256 = "11kb0f1iwlxrd3iymd3vmlk9imf4inqirlcnsg22x23bfa4xvdb0";
      }
    ];
  };
}
