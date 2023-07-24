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
        version = "13.4.1";
        sha256 = "0ar82rxafdy4wg60c45w1n9iq60ysx5zl8j5bs7hmmp3wfhzjnih";
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
        version = "2023.7.2105";
        sha256 = "0qz59vn9dyq9pxaxdg6dyk74ixzs0rvss65qg7rw16p39v4ri7p3";
      }

      {
        name = "vsc-material-theme";
        publisher = "Equinusocio";
        version = "33.8.0";
        sha256 = "10siy3vl5cqak0dqsqfdz0fmy86s0bh9lvvkv7x584ib1d9h13pq";
      }

      {
        name = "vsc-material-theme-icons";
        publisher = "equinusocio";
        version = "2.8.0";
        sha256 = "0ayrpji30ff82hlsrp7w5b7d7vgri3v610h5h257hl72n332djs6";
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
        version = "1.98.280";
        sha256 = "1pki4qn2c6sqvzwb4qqqzplymg9qndzvrqm0381v4m27cf0xj21s";
      }

      {
        name = "vscode-pull-request-github";
        publisher = "GitHub";
        version = "0.69.2023072109";
        sha256 = "1rv2n4g02yyymw93ywi7bz36xbyngkzahghfgwqznx0vg9h36xgg";
      }

      {
        name = "go";
        publisher = "golang";
        version = "0.39.1";
        sha256 = "0kj8s71sfi1bjirdxv4wicwbmrdryll1sfnlfqwz7j2zc05961l0";
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
        version = "2.4.0";
        sha256 = "0hq36kv86klhmis29r513f3mncrgadjks3dnjp67kq61djmm5cjl";
      }

      {
        name = "Ionide-fsharp";
        publisher = "Ionide";
        version = "7.8.4";
        sha256 = "1yw43ald9g6n0xlnnf3zdrlr6nq61lxswggchm9iradwlag7pkyl";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "9.13.1";
        sha256 = "0rx7r7sj1aswldjax1g0hxb79gpwc22ahkdqax24nvw340wy0c8g";
      }

      {
        name = "better-cpp-syntax";
        publisher = "jeff-hykin";
        version = "1.17.5";
        sha256 = "16dpgs4blis4yajw51yhby54pag28r74wwf6szx4nr79f44lgh7y";
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
        version = "0.16.58";
        sha256 = "0v9lg4lx4yrrk9ziqgnwvajbdyfnr5j7x8p8qiwfp98ws3lq57vv";
      }

      {
        name = "language-julia";
        publisher = "julialang";
        version = "1.47.2";
        sha256 = "14xb3x7m01lkl8xv6yvdzs0s5gwi94yfj0h8flay8fw6wixfghbv";
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
        version = "0.6.45";
        sha256 = "12hpmfiwaiq88qjhl1fwiyys0bdilyhk1cq6qa9cv07qbx5cmwbq";
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
        version = "0.0.39";
        sha256 = "0h1h2j9ycxjrw9qds3ma6n1xc1na1kv129fnlk81hfkjhy01q517";
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
        version = "1.26.0";
        sha256 = "0fsmyxi0iwr0qr9fl86hsfqw8qlj3s9dzp25smx778zcvqxwlha6";
      }

      {
        name = "csharp";
        publisher = "ms-dotnettools";
        version = "2.0.283";
        sha256 = "16xvadjwa5p2x81ffn8jkh2jg02x8fp52kz30fd78vik3dpmndh8";
      }

      {
        name = "dotnet-interactive-vscode";
        publisher = "ms-dotnettools";
        version = "1.0.4355021";
        sha256 = "11lblsz8q3ba6zlhld8ljnrpibqss433rp7fbzdl1m350icl8w7j";
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
        version = "2023.7.31";
        sha256 = "1x3vmxicgzymxb0rjiwmw4rz8cm1kjq7wk42xqci5jqdxhwnjlf3";
      }

      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2023.7.1002041100";
        sha256 = "sha256-6CVugesiUpuPxYn2oiSB8crhxjMMdhQ7bC8+IprOLtA=";
      }

      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.302.0";
        sha256 = "0fnd4929swjidkg7a03a59w26qympm04kqxnr0wiii48g3nw7c79";
      }

      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.103.2023071415";
        sha256 = "04rdprfj3ihsfc35d87pdgyyz7jgf05r8vzz39fxwr8977marp5z";
      }

      {
        name = "azure-account";
        publisher = "ms-vscode";
        version = "0.11.5";
        sha256 = "0zcnanznaglr8zcxyqk0slkmzmb0jp2pzc7qjbnxg6zn60846882";
      }

      {
        name = "cmake-tools";
        publisher = "ms-vscode";
        version = "1.15.24";
        sha256 = "0rfkmb8w2fkyxbxg1lpdydbczklhp7pl50vk3mzl9dm0qqxgy2yw";
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
        version = "1.0.5877";
        sha256 = "0fg636hjajw86z4invklys55d7k2sckmzvjb81hwbzdjv1dywxab";
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
        name = "ruby";
        publisher = "rebornix";
        version = "0.28.1";
        sha256 = "179g7nc6mf5rkha75v7rmb3vl8x4zc6qk1m0wn4pgylkxnzis18w";
      }

      {
        name = "java";
        publisher = "redhat";
        version = "1.21.2023072104";
        sha256 = "sha256-+IrlTSgB9yvkaFcI68k/nKO/yXuf9R5cNCZBpn6GjnQ=";
      }

      {
        name = "r";
        publisher = "REditorSupport";
        version = "2.8.1";
        sha256 = "0qfmgmn7n0zgphnj7fvksx8li93wywr0wllzvlmqxpxz4qnzrmcn";
      }

      {
        name = "rust-analyzer";
        publisher = "rust-lang";
        version = "0.4.1598";
        sha256 = "0rs82n3pl1sn7al0rxk7y360vz4fb7crfq7a2xr0rzbjnqsiziwz";
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
        name = "shader";
        publisher = "slevesque";
        version = "1.1.5";
        sha256 = "14yraymi96f6lpcrwk93llbiraq8gqzk7jzyw7xmndhcwhazpz9x";
      }

      {
        name = "vscode-stylelint";
        publisher = "stylelint";
        version = "1.2.4";
        sha256 = "0yi28cbjzy6kp7hmkvv9ggm4n245njsl5j3k5z3kmbx95yy7rclj";
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
        version = "3.12.0";
        sha256 = "1vijylq0xs6bwly9lgca7qwr9bs4l3vs40dac8q9azvzixxrd7qv";
      }

      {
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.52.2023063003";
        sha256 = "07kf7wmssxwf4id927jk198q6paq8icylszshwrbx5ygdhjv0k53";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.25.2023062906";
        sha256 = "1p325909f5avgljgfijqngs23dcz9w2hbdi6j1rk7nnrj6qycb31";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.39.0";
        sha256 = "113by42ydplwrb4b9s18mps5z9nx4pjdfdsfbjgx2h66x1hm4lb3";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.41.2023072203";
        sha256 = "1wzggqsndh37rrpa29i27kirkf51g9jd9i7fv39zvzf4krcvm852";
      }

      {
        name = "vscode-wakatime";
        publisher = "WakaTime";
        version = "24.2.0";
        sha256 = "1adz3m3l3k4a4cqqzmb6h32hjkd3a42cb9a3i1375690kfn1w06l";
      }

      {
        name = "vscode-zig";
        publisher = "ziglang";
        version = "0.4.2";
        sha256 = "0k56ildn16sd24fcpabgxrn1r1arpjjbsra9whg4l73rnrb435nv";
      }
    ];
  };
}
