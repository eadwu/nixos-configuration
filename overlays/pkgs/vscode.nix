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
        version = "2.4.1";
        sha256 = "01xmwq0l912ysjqazzm86yz4jnmzp0j0hmp2hlqr8f6zbws5sas6";
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
        version = "2023.5.2112";
        sha256 = "1s7pw7rl3k4jg15v4c10zxx68iw8vhphyda3a5nwzmpn2m2zglmv";
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
        version = "2.7.5";
        sha256 = "0p3kimkksq5rxk4vm1bf95q3p8dyw909anqxhik9dm1j4c9mvqds";
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
        version = "1.86.82";
        sha256 = "114ig175iz6fv40wiiq7xprdr1apikvl0jkkh8ygvfr6n27amila";
      }

      {
        name = "vscode-pull-request-github";
        publisher = "GitHub";
        version = "0.65.2023051809";
        sha256 = "08vp4apf4ncqkxnqgrf4riljryn1msbxrp3s8n8j5k37hp59n6js";
      }

      {
        name = "go";
        publisher = "golang";
        version = "0.38.0";
        sha256 = "0i2kmlabpsvrb02ljy9asdlhqssm6as3h438rq0lx67qbjwsirf0";
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
        version = "2.2.4";
        sha256 = "1qsvfb2a2k48gndda92w91z9acis43a151cdwmkmb8qprl311768";
      }

      {
        name = "Ionide-fsharp";
        publisher = "Ionide";
        version = "7.6.1";
        sha256 = "12cvn27zj3zbg2p3c49am7yqjyprd8w0liq8kd2kkyvrw7jpkqxj";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "9.10.0";
        sha256 = "05i6qsfg4pdkm141lddibrcm935qfdpiyf6kxf0g9g5ckpvvqkxk";
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
        version = "0.6.41";
        sha256 = "063h3h7my49clci43jqnzrv5c2v9r5qxcxlrs414md1bcqfqmr1f";
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
        version = "1.25.1";
        sha256 = "1r0h6mi339gbczz3rrr1k2hfxk6w9f1pvpf4lrclp670nldfch5w";
      }

      {
        name = "csharp";
        publisher = "ms-dotnettools";
        version = "1.25.7";
        sha256 = "1hxhd3snsnsxzi5zypxay8jddr4mykph7l6rkgyfby7c92m7scpn";
      }

      {
        name = "dotnet-interactive-vscode";
        publisher = "ms-dotnettools";
        version = "1.0.4260011";
        sha256 = "139ayzma53r2r75h8wm0bmsipk9fk8d3n5bf0xm0sypl02ry0v0z";
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
        version = "2023.5.31";
        sha256 = "06km01x6w19q56anir6n5psyvkhi7d2ds29lp1xsskwyx37v5287";
      }

      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2023.5.1001411100";
        sha256 = "sha256-lTDxNDzt3XX33toF/XZ5hj/0uJ6x0fZWze4FjvABJn8=";
      }

      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.293.0";
        sha256 = "1p9lv94qi5sfd225lnbr6imwp9xsrpvkwr8hialakqwrcbw4qj1v";
      }

      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.103.2023051015";
        sha256 = "09g6jd3588nz0rh6ag3mwdsl66l9mcips1m6y43v9v26ycsab9qd";
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
        version = "1.15.9";
        sha256 = "03q4zfpzv32gazhjhzpq3vkckskc7wc6fj2qq5ddwsvr5hdkkr12";
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
        version = "1.0.5864";
        sha256 = "1dncvc9j8g1wl1k2pp2jgijqp48ljc8198f8iycidz683f4kvlji";
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
        version = "0.1.14";
        sha256 = "0g03msqlbgwkbryj3j8inshgf55pk1gspdhha9ian862pg1z548l";
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
        version = "1.19.2023052004";
        sha256 = "sha256-S28pP3VhDba0vr7f86ffKTJbDsVv3mSM8CYNJNoCsec=";
      }

      {
        name = "r";
        publisher = "REditorSupport";
        version = "2.8.0";
        sha256 = "1701h7zl39kxinhiln6kapj3cvm5c9pm0lx0v7smj3k8a0lmkamx";
      }

      {
        name = "rust-analyzer";
        publisher = "rust-lang";
        version = "0.4.1523";
        sha256 = "02lmvcrq1fb0ma62q2mcnchwcp14lqp4m047dwgfnd8gp586da0x";
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
        version = "3.11.0";
        sha256 = "10xq4s0vnjbximh30a61i4liw42ynm81apibhl7p2l0159227qkl";
      }

      {
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.50.2023042406";
        sha256 = "13dnbgayw2rym0rwz7nj9y2cspszgn9gl2zhw20lb3lq884misfz";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.25.2023042006";
        sha256 = "0igc60dgnhl95cr8z7n4762b4lnf845zrnawnv6f42w7yigqwchz";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.38.2023051002";
        sha256 = "0ml3pcpd6pjpbkkwdkkmr4vnfwl5z1870ikmbvr8frh5gsf88pap";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.41.2023042103";
        sha256 = "0yagy5v2g7gmcl3b0v4vzxi6jq4casx5pwkz6099nplnc7v489nh";
      }

      {
        name = "vscode-wakatime";
        publisher = "WakaTime";
        version = "24.0.10";
        sha256 = "02dji5k0nndyrqgbwb45qd9lylygz4ck8w5ckl4r28wj4gd7gjnd";
      }
    ];
  };
}
