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
        version = "2023.3.1104";
        sha256 = "1j42hh6fpimnf5cgp68x0081sk7vz6gc57znkbc291bhkdgh5v8w";
      }
      
      {
        name = "vsc-material-theme";
        publisher = "Equinusocio";
        version = "33.6.0";
        sha256 = "1834pfzszn8n6aq65vpgz7kk7nfd1nlp3rbfsnzw5gvgk6rnlx44";
      }
      
      {
        name = "vsc-material-theme-icons";
        publisher = "equinusocio";
        version = "2.6.1";
        sha256 = "1gg122sm82s7ci4zry0k6cwfi8qh8fcs3k3xk7fpnxl5cyrcf38m";
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
        version = "1.77.9225";
        sha256 = "1awqw7bpyvw72hnj9l1hx21djgjpjl15h5pq5la408ll4rd2645m";
      }
      
      {
        name = "vscode-pull-request-github";
        publisher = "GitHub";
        version = "0.61.2023030915";
        sha256 = "0njm4g7jz5q1iq9rw9n4016sy0cjx9781vjr64b9pk6czx891l5p";
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
        version = "7.5.1";
        sha256 = "0yrj432npk55aw28xz0d8vds1fd86f0r9a57zm7ay5vyh6lxh802";
      }
      
      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "9.7.0";
        sha256 = "0gkgzd1z1y1acnd0a15m3h43i38pnf60wpl4vjcw09qfx84ahlk3";
      }
      
      {
        name = "better-cpp-syntax";
        publisher = "jeff-hykin";
        version = "1.17.4";
        sha256 = "1zn4n4hjplz0p3bbbiliw9bnca69b0cg5h31k9rilnycvbc2c7kf";
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
        version = "1.41.1";
        sha256 = "186lrckvzkyqvxmzi7yi9rhx5523rhah95ra3by049lsr9hkzzw7";
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
        version = "0.6.39";
        sha256 = "0ljmrgyd6sxd40gg0l82nxrp90dnaj20r1lc1wgmkv02v9qqrpq7";
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
        version = "0.0.37";
        sha256 = "0jysd37x6j6r8vagkqqxjrmjda27fv3p8b9f97npifmw3n46p931";
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
        version = "1.0.4160021";
        sha256 = "17q6fd1bx4mka32d1aj6ivkixd8igp60l03p3ldmwib1vkx5ja51";
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
        version = "2023.3.21";
        sha256 = "0ih9ccmi61dv32w4caian9aghr7cv4lsrn3b02xprx0bfsdpz3q3";
      }
      
      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2023.3.1000711009";
        sha256 = "0nzd03sb1lhxzdma00wf4yyiwjf90v6hva89x72af2cgvw61fz5q";
      }
      
      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.283.0";
        sha256 = "13b33xymj8ah7v4rmc1swj5w0jwr5ynwxjjbks75c76hnw6779id";
      }
      
      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.99.2023030315";
        sha256 = "08i9zymgxl1ddqkq4gbz7qvbmnaaqf367n8qzc7srix512py669r";
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
        version = "1.14.15";
        sha256 = "1kils3rjkkl7xdc8wyw0df094syr0g3w8k5yzs4i0rs0n7bqd3hn";
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
        version = "1.16.2023030903";
        sha256 = "sha256-2bgcW/L/ziGMmpkeO5f389Qu7E/Nw3+HoeQxnH8/XOc=";
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
        version = "0.4.1434";
        sha256 = "1qws81wcmxppr2wx5kjm7mrj9qk7qhqh6q4p77prjh539lwccspm";
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
        version = "3.7.0";
        sha256 = "0mckrjfylz2m9wsri2qnddad5k9jpqdrb28rn8y9lx1ra9af9rpz";
      }
      
      {
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.49.2023022723";
        sha256 = "07z14s65ajxax92yxh6i9kd071xf2i51p3mslcn12g9m14nvgq8d";
      }
      
      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.25.2023031100";
        sha256 = "0ysl7gdjmkx1rbf88d8gzhmb0p070ip48srjgvhvfr5qxwmvlnpi";
      }
      
      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.38.2023030203";
        sha256 = "1paya269aypzs13cbvy9ns3mwkvp4vmjhg6yn6lw1iq1p4gqvaxc";
      }
      
      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.40.2023030703";
        sha256 = "08mzvkxy8qj91xa05sh87v2djdwapvi07gqvvfb6ajamk3zc3nqm";
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
