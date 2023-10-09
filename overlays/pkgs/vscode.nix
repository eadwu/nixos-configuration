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
        version = "2023.10.705";
        sha256 = "1bh2z982m78lajqyls695w7zy7c4366dfp9rpvz7pmw886vwjjvv";
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
        version = "3.1.2";
        sha256 = "1w478lq5ba75i41v4vj0vqhl1v5drg7j6zk01xf1miyc5qayg1sk";
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
        version = "1.123.471";
        sha256 = "11h23bfr7sz5z0gl8qnyd9lhvz5brf4fmaxiy0xp6qf4rmd8dvg9";
      }

      {
        name = "vscode-pull-request-github";
        publisher = "GitHub";
        version = "0.75.2023100509";
        sha256 = "0523wxwr9s90v96wc3xj5130i0sm367dg1kqbg7c2y0k41zvh01b";
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
        version = "7.13.0";
        sha256 = "1nw6gk7l08m9n638i8x64xvnqcr2g985mqwc77ihb7iafgpm78y2";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "9.14.1";
        sha256 = "1a8im7n25jy2zyqcqhscj62bamhwzp6kk6hdarb0p38d4pwwzxbm";
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
        version = "0.6.46";
        sha256 = "1rs5kypqy4p4rzqyjdqfxgvp1zzpbxbqb5my5z67i8ps535c8r75";
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
        version = "2.5.30";
        sha256 = "00wmd5nsfalqlgrxrcpx47f5nbiw9z3xgka5p68sfrx3p3var5n6";
      }

      {
        name = "dotnet-interactive-vscode";
        publisher = "ms-dotnettools";
        version = "1.0.4505081";
        sha256 = "19lwhcf9jryyp5ik104b5119z9qfz41c4ax2bk5527ifpw3nipdb";
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
        version = "2023.10.11";
        sha256 = "18zbqfqv2lgzdj4dyigki3vs4l1nx8zc3b7723yz6b0k65cackf9";
      }

      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2023.10.1002811100";
        sha256 = "1mdla99vm3pgnlarycl5mfg1k8f7vf2jigraisar15f9iivfnd0m";
      }

      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.317.0";
        sha256 = "0bhhlffrnzrv3sv72168132ywkinj7lz75ylvcw9rvn5pifix9r7";
      }

      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.107.2023100615";
        sha256 = "1q73mznnq8385d0g0gvn3iq8j16zrin84czz0fzc8w99409mq5x5";
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
        version = "1.16.10";
        sha256 = "02vydyb41j44kwy27gajyd1ygfwvv3aa2y9kz9hn1jvfcv1lwvss";
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
        version = "1.24.2023100804";
        sha256 = "sha256-XGpqh+no9wP5HjU2VynOuabWFJCieVEKux7FgDN+54Q=";
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
        version = "0.4.1688";
        sha256 = "sha256-JvYWdQEkUF6DK8Kvmf+/IaLyjL8YhsetVDv3OUrT2jA=";
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
        version = "0.25.2023100708";
        sha256 = "0n0kbk6s7n866040k1knx21sig14d614krd84w3sq8nq2l88xb88";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.40.2023100808";
        sha256 = "1wdw5hckpn471d4jjmvg04j53fs8sc1lhzca8f5ac75zz4i61xy4";
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
        version = "24.2.3";
        sha256 = "1vz18x2n2c9jamla233mip08978sq1r5f38a78yfdgfpb7z802ni";
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
