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
        version = "2023.10.105";
        sha256 = "0lr0vnswcc1c4s0k4ckjzi68w4igk37n0i7y0cwgvyw031y5yvbl";
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
        version = "3.0.4";
        sha256 = "0qndx0qpkyiadracysccvijvlm71g25nv5lzfvblzmj7507rcvxa";
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
        version = "1.121.456";
        sha256 = "0q7kd72vkxbv5pc1iz0835wyp71v990v4bz1chv6z0qpxnmvq7ab";
      }

      {
        name = "vscode-pull-request-github";
        publisher = "GitHub";
        version = "0.73.2023092907";
        sha256 = "124zclvxafl8fkp3ija36jm59277kn8biw0a16wmlzilg4fnirni";
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
        version = "2.5.0";
        sha256 = "1dnqw3mkzdfqaqy11ygl3cwnfjm30k5dazldl4pqgb7mw11n32as";
      }

      {
        name = "Ionide-fsharp";
        publisher = "Ionide";
        version = "7.12.4";
        sha256 = "0m7lhdir7q1v3k6dl3yryj1rlad82bviniwnkzqs9xb2kycvm9m4";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "9.14.0";
        sha256 = "1m3j9ca0zs1n6m8jn9911jyb2q217xrwkzacwmv904anslxw3j3i";
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
        version = "1.54.2";
        sha256 = "1mpq58zsms58jbf12b7xzihcc6q899g89a8pmwwhk9sr2i4nnczp";
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
        version = "10.41.2";
        sha256 = "0qmhaf7hrn5lqnav1082lhgzl0f8biw3lvqxcm2wmcc6q2qs64rh";
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
        version = "1.26.1";
        sha256 = "1lg8asfdc0qm4ysqkxbwq5lf83cb62m1j1iw5fcyzqaz92v55ggq";
      }

      {
        name = "csharp";
        publisher = "ms-dotnettools";
        version = "2.4.4";
        sha256 = "0mlhnj8cr6yy3hirxsz5vmphd7fsx7bxf5jski4kqiy8a1rnmv77";
      }

      {
        name = "dotnet-interactive-vscode";
        publisher = "ms-dotnettools";
        version = "1.0.4478051";
        sha256 = "1cdmw30rxrf820nrcpn0abid3rr4aihbjbjl73lb3i3x8i0v5s2l";
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
        version = "2023.9.31";
        sha256 = "0f9px9652mm4mb2zz0qrppq2psh7z4jr6hz9aj2p0hm2k4fcvr38";
      }

      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2023.9.1002741100";
        sha256 = "1np5jjk94ckp28fpyfrmg7r2swm6hv44cpixpibyc0dzp4vflgz2";
      }

      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.314.0";
        sha256 = "0nn89i894xliqajlmlj55wpq10a5bx6xii5sbbac9zavgrfwf4ml";
      }

      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.107.2023092715";
        sha256 = "1wczmirgqh1hvmrmlk7jqgcbz7il4zmmjcqymw2whckw4psgl17m";
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
        version = "1.16.8";
        sha256 = "02h2zlxnx6swfqfylsy8l4sbhcywjq4l88i2hyc6ysj5fs0f2m4f";
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
        version = "1.0.5883";
        sha256 = "1zgjz25s1x1n93va7xbadmfjkqr2rahsrhpiw22xsshvswh4pp04";
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
        version = "1.24.2023093004";
        sha256 = "sha256-ym8Qa/ZMKptOjypObksMXfxkEfvpnQgXcfrk3vS9NiI=";
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
        version = "0.4.1680";
        sha256 = "1s02a8zmsxy0rsid6wicb6vcpf5na0lvivdwqvf4591zkg7bxxp9";
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
        version = "3.14.0";
        sha256 = "0k70f5f4hcv3jl3a04736ml8amx8w7wb3mb8f6l5gngnvq9fj528";
      }

      {
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.54.2023092623";
        sha256 = "1c2rr5hrsx00jqmjz1jfppbqbkd0276hl2wl71wj9sfjr3052f6x";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.25.2023092206";
        sha256 = "1nqd29mxxgrg9kcid9g12d93yasgndv99g4rlk5shjjjhbc535bz";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.40.0";
        sha256 = "112z5wg77pggp5r5g3km1as9sdp173655vf8x5mxnrjswhl74ybi";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.42.2023092603";
        sha256 = "0l7wkypx1d87822p3c7x9zz2z120087s64n6wcgabcksvz0632vk";
      }

      {
        name = "vscode-wakatime";
        publisher = "WakaTime";
        version = "24.2.2";
        sha256 = "1i8y2kz8lhb4mvqq263al3xm4h8md77slk664qj2z9nksfiin168";
      }

      {
        name = "vscode-zig";
        publisher = "ziglang";
        version = "0.4.3";
        sha256 = "0d2wqsbrh499xyfsjxbbf5d5nf329n6hp4dvhyqbgaqzsp9pzkqz";
      }
    ];
  };
}
