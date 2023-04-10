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
        version = "2.4.0";
        sha256 = "02q5g5p2vy7yxm2l89zvlkfx4rkdyzrrjaa97gl5sf6g88k11igc";
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
        version = "2023.4.805";
        sha256 = "01080x5x0wpwkhqkkk6m3wnz1g2bdh4116kb3wi20aggx39mbqkx";
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
        version = "2.7.4";
        sha256 = "0zjn22d9bkd93y6y9659ahbs12r7i07jw3fnffi4rx9cvqfmn9mc";
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
        version = "1.79.10634";
        sha256 = "1a0s09aq66wkgc7560ggwh7sr0li5z2zrv65c8p080l3znc9lipi";
      }

      {
        name = "vscode-pull-request-github";
        publisher = "GitHub";
        version = "0.63.2023040609";
        sha256 = "1iahn136djgwipb8r24bdzcmgw78xfl6gvlqbvl5h4scyiifq98z";
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
        version = "0.0.224";
        sha256 = "02xdyfimlmpl7i1jbnbnb0mqjbypgy24ajbx1dbbp5cf0v66dc9r";
      }

      {
        name = "haskell";
        publisher = "haskell";
        version = "2.2.2";
        sha256 = "1d5b0p6r9ipwb7j4cx9w13vq31h78bh2sfwl54xri4gyvialhryd";
      }

      {
        name = "Ionide-fsharp";
        publisher = "Ionide";
        version = "7.5.2";
        sha256 = "07nj59j5v3rz4mhrj7vl5dd60spzklycm8mjg5kh86wsy7ddsrxz";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "9.8.2";
        sha256 = "11sl36swl6fj30mfscjw2m75j64qk22j2h2frfh6vypaip057pwj";
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
        version = "1.45.1";
        sha256 = "1bid8p5i7sx6qigj0g3n5kl7v3kvgih54rrfplc7720sc7g9ybrw";
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
        version = "0.6.40";
        sha256 = "1dvngm5cvn7dvg570palq9f86jxrji79qx8k9nhmw0k5l1y26283";
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
        version = "0.0.38";
        sha256 = "0245rldwk99qbipl3f6f5c9zv2mzh3930rs2xin7hbj15ja54gjs";
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
        version = "1.24.0";
        sha256 = "1fgkqcjxg77n434jjna8hs7qrj1cmq060sb7gidsagni18lzi7fd";
      }

      {
        name = "csharp";
        publisher = "ms-dotnettools";
        version = "1.25.4";
        sha256 = "0mp550kq33zwmlvrhymwnixl4has62imw3ia5z7a01q7mp0w9wpn";
      }

      {
        name = "dotnet-interactive-vscode";
        publisher = "ms-dotnettools";
        version = "1.0.4207041";
        sha256 = "1pik1qghsixrblzkwfkd3s09yp6izlshh1qwny0ayww295d7yfax";
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
        version = "2023.4.11";
        sha256 = "1gayih5z1d0f7vljrzzdhaw5hf9q9gycasri273y5a0h7gw1hh7f";
      }

      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2023.4.1000991007";
        sha256 = "0w20jgbfibfvyvpbc6zj9rg80wpwvpm7bknk4gmfgqn3av9jflnz";
      }

      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.289.0";
        sha256 = "0hn3213ml2x0x6hmimgvd45s64m19djm960ykakwzwbiaaaj5f2k";
      }

      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.101.2023032915";
        sha256 = "1fpinpwsjvw248lcs0g190ampwsr8hxzxbjxcx40kx2zhjbzg5lp";
      }

      {
        name = "azure-account";
        publisher = "ms-vscode";
        version = "0.11.3";
        sha256 = "1kd0j9iysnqjws05kg14mfjbgm6ihkpk6yxl4sk4qdhm3ig3hi5i";
      }

      {
        name = "cmake-tools";
        publisher = "ms-vscode";
        version = "1.14.25";
        sha256 = "1ymbk3f6gl12b4xmaslvkbhfchfy2y1dfg8j8d9bvvs1xx2jga96";
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
        version = "1.0.5834";
        sha256 = "0xh719xmacgyn59xvbl4isb5xvg5i11bjmqpqra5pm8niyyy59zq";
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
        version = "1.17.2023040704";
        sha256 = "sha256-d+vZv4UW8nUkz+Fp06GNQBLmbtWaiTnyaBPmvkN3kBg=";
      }

      {
        name = "r";
        publisher = "REditorSupport";
        version = "2.7.2";
        sha256 = "1h851vqn2bs557gd6hwgqh8pzxbfpry8w2hnqza62w5gldkk938g";
      }

      {
        name = "rust-analyzer";
        publisher = "rust-lang";
        version = "0.4.1470";
        sha256 = "sha256-WzOBzPhjjrWKI4gQgL/fRhJzz3qs16IeMyYq+tZL6KE=";
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
        version = "3.9.0";
        sha256 = "0101301kmmmxsigan6aii1bz95vdl9cygap66l1fixhcph81alqq";
      }

      {
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.49.2023032407";
        sha256 = "0p57q47bylrrpg75zd6q5q2qh8f8w88d52rc7l3xzdzbrl27l4k7";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.25.2023032708";
        sha256 = "1fn2rqxip1839iw2skv1wwymirzbsh9iynqhdp60gkimg2w36504";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.38.2023032402";
        sha256 = "1sqmk0n895ap6vpyr067i5ichz3pqrj3f38k863dcf5fx31sqqp1";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.41.2023032803";
        sha256 = "0dr015ni3cs0vhh6rvpvnc0vsggz0973z8pck0j6ks40yac020v5";
      }

      {
        name = "vscode-wakatime";
        publisher = "WakaTime";
        version = "24.0.7";
        sha256 = "1vg5k5wfwn13f9knrm1y75i4c3grgyhik4z5gjz2bjdfi5933al6";
      }
    ];
  };
}
