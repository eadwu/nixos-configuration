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
        version = "2024.40.0";
        sha256 = "sha256-WywV9uEi76NKY9sApGfnhIN0CQQAqMGw6jidkmGaQrM=";
      }

      {
        name = "path-intellisense";
        publisher = "christian-kohler";
        version = "2.9.0";
        sha256 = "1sshl8za6wviaikad8pisisn2x1y382npsh7grw3vdfi4j3awb8g";
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
        version = "3.0.11";
        sha256 = "0np0yzrqi8pv3ja0d5dsy9b4vrc7vqg6085yr34bcavsgksrrmms";
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
        version = "2024.8.1005";
        sha256 = "1vbv04yfzmzk3mzc140ph4nc0ilwfirrxyj9svil5fry7y5m57d7";
      }

      {
        name = "vsc-material-theme";
        publisher = "equinusocio";
        version = "34.5.2";
        sha256 = "1vfmdkjs93b2pg7i0am70c2mgmiyrb4n8hn36nxf0xcwgdd0fl0w";
      }

      {
        name = "vsc-material-theme-icons";
        publisher = "equinusocio";
        version = "3.8.7";
        sha256 = "0a5fq5s53m9qbp711y1lv3f9fm3kgqb9wlnx4chb2i521a9afbpi";
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
        version = "1.221.1040";
        sha256 = "1lh781lzjq033j8dxkgidz1d2k493lxkamj2z7463vwg957yssxk";
      }

      {
        name = "vscode-pull-request-github";
        publisher = "github";
        version = "0.95.2024080804";
        sha256 = "06pzsmz2b71zsjszwwlva04dwp8y9vga10drn9kbk0378s8hn16a";
      }

      {
        name = "go";
        publisher = "golang";
        version = "0.42.0";
        sha256 = "1ma14642lczgrigibv03yva4jcyy4zpf73bibzy83cfb9kj9wz7l";
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
        version = "2.5.3";
        sha256 = "13s39fvb6kwxklcfsa5xh4z7y8y3y0h6jv39ljrgl24qkwgx8xnw";
      }

      {
        name = "ionide-fsharp";
        publisher = "ionide";
        version = "7.20.3";
        sha256 = "1kjpanadhpmxvspzkyx34hfpj0gy6ca2ag8al4fm6nf85cjhcmxy";
      }

      {
        name = "latex-workshop";
        publisher = "james-yu";
        version = "10.1.0";
        sha256 = "09hw9jx7b3cldra8bvkzksb6a3rl6fckw7gabii5nqp1wp9nd1ws";
      }

      {
        name = "better-cpp-syntax";
        publisher = "jeff-hykin";
        version = "1.27.1";
        sha256 = "037nigza7n71j5vgl3qw0swrmy8gvfj9m8jbi1nb2a3lmsifivqq";
      }

      {
        name = "nix-ide";
        publisher = "jnoortheen";
        version = "0.3.3";
        sha256 = "1rhb845l32r9ncwxynngq1zji2lf487ryc54n8hw8y9hph95pw7y";
      }

      {
        name = "lean";
        publisher = "jroesch";
        version = "0.16.59";
        sha256 = "0nq6x5h1zgjgqxgacb951hbgrin7c0cyvhacfwqy05q1ccrq0y5m";
      }

      {
        name = "language-julia";
        publisher = "julialang";
        version = "1.106.1";
        sha256 = "0h5gx0zxvd4dm8pmkynpaikg55kgxs78aqzgzghxa16z0f115pmy";
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
        version = "24.4.0";
        sha256 = "1f6dn08d0f6m12ywdq1bl7wxbbqfdk2adw4xpkw5m3d44p4nchpx";
      }

      {
        name = "vscode-docker";
        publisher = "ms-azuretools";
        version = "1.29.1";
        sha256 = "0zba6g0cw2h42gfvrlx0x2axlj61hkrfjfg5kyd14fqzi4n9jmxs";
      }

      {
        name = "csharp";
        publisher = "ms-dotnettools";
        version = "2.41.26";
        sha256 = "1jvybpkar5flaaw0dvhdxvj0b93zlspz02xii00z9iqw8wibgjp4";
      }

      {
        name = "dotnet-interactive-vscode";
        publisher = "ms-dotnettools";
        version = "1.0.5381041";
        sha256 = "0y02h3vr3p8ny0gs3584k55c0jyh7ryghaq5nvnr4p27cd95n9na";
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
        version = "2024.8.100";
        sha256 = "0mfkq9gr034x9ma54cfws22jh1i9vy2q0iv2whnpvxc0c5yngnlb";
      }

      {
        name = "jupyter-renderers";
        publisher = "ms-toolsai";
        version = "1.0.19";
        sha256 = "1cv1qr3cjwpnlpccg8dwcds96ycb8i0wy97b324inrjhcgfgg7fp";
      }

      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.381.0";
        sha256 = "0ckky1s1ppw8abn7h9crd6h3qfr5vhdgp0z2zdqis16h86jcnq58";
      }

      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.114.2024080815";
        sha256 = "0jx438c9766aqgy94vsb4n0yzvhgp72c94vh5dy7vwf03x0mwk8p";
      }

      {
        name = "azure-account";
        publisher = "ms-vscode";
        version = "0.12.0";
        sha256 = "16r35186k9wy5p2yngsl6hhw52b5bim8jz00jzb6372j532xraq0";
      }

      {
        name = "cmake-tools";
        publisher = "ms-vscode";
        version = "1.19.38";
        sha256 = "08ccf9abkj1znvhqhlr9bh3lwjivm22m0f5y3kinmr9nrascx1d6";
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
        version = "0.5.2024062701";
        sha256 = "0apk60zc5hrf2hjxiffp6q49yckma4k2gid2lm03mv0nm8yifxfk";
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
        version = "1.0.5936";
        sha256 = "0l5r93zx6q1srfjz7y29xcsgjfx8z4hsd1bwa02ysgdxk2iwldpf";
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
        version = "23.0.170";
        sha256 = "1rwly0vm59d96k7isiplnmwsi77bzv3b0r98mwm7hp6gcpwp9bll";
      }

      {
        name = "java";
        publisher = "redhat";
        version = "1.34.2024081008";
        sha256 = "sha256-l0b+6XUSZ0ZVp6IeHH4ufHJB/vNuPqGL1IbLuEq5IVA=";
      }

      {
        name = "r";
        publisher = "reditorsupport";
        version = "2.8.4";
        sha256 = "1jbdd74v2myr47ld4r703hyzpisl61canzbghlqgza1fjpygsm61";
      }

      {
        name = "rust-analyzer";
        publisher = "rust-lang";
        version = "0.4.2069";
        sha256 = "09xj4iy4i61cs5d2p9c2qak93y5ml1d93fw54q50ryghi92ap92a";
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
        version = "0.7.14";
        sha256 = "0nr5zfvfqfa9ismfm0shk8ikxxc9vriiggas93p1mglgkdcabia5";
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
        version = "108.6.0";
        sha256 = "1qsn0xvzc7pvn9misqwfjdz765ryq9c0idaxw33iwdjkv7hxdcha";
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
        version = "3.20.0";
        sha256 = "0gfjp17f54439hsg83v5x522qjp0bhbsjwy7b4f42zmbxvx9606j";
      }

      {
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.58.2024072207";
        sha256 = "0g62884bbv0d63risxaxsw09p13znradai7ix524155f45x7mn4g";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.28.2024080506";
        sha256 = "0hix5jzr90a4rf8av4ni65llk00aivhfbhx7f1hg966vrnmiaynw";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.42.2024080609";
        sha256 = "1dwrzfjkbkbl4m63722kik5fdrci5g8js3z8wka0rgy0y9bkiqif";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.44.2024072906";
        sha256 = "0mxlqkcvvy9kyhq5v1b7jrv3ngb9p7ah5n93cvkjvxp0wz6ijbzm";
      }

      {
        name = "vscode-wakatime";
        publisher = "wakatime";
        version = "24.6.0";
        sha256 = "04jhyfyfgmyfa6kywyrc0g4ns7qs45ivr5dmnj725ghr03w8ab2p";
      }

      {
        name = "vscode-zig";
        publisher = "ziglang";
        version = "0.5.8";
        sha256 = "1q3sa5lizaqb4j5426d91qrkc2g9ccrh47x3zk0jjk3bnrixm4jv";
      }
    ];
  };
}
