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
        version = "0.6.19";
        sha256 = "15s2mva9hg2pw499g890v3jycncdps2dmmrmrkj3rns8fkhjn8b3";
      }
      
      {
        name = "gitlens";
        publisher = "eamodio";
        version = "2023.2.2411";
        sha256 = "1sb2gcv5simc4rm8fx0zyryz7nsbmm9jbxzrh2n4x8852db1cjvf";
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
        version = "2.5.0";
        sha256 = "1cfrdadwcvkdb4mxkfiqpsq19kngnk98cm3qanv494vr2rrfbbar";
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
        version = "1.75.8985";
        sha256 = "1lf37d4vqq0sidv10cyanlnd1dyr7finyarkw56wlip338jdrba5";
      }
      
      {
        name = "vscode-pull-request-github";
        publisher = "GitHub";
        version = "0.59.2023022411";
        sha256 = "1k793nf639dc55n4p99gslzwn0y5f2rzjzbqq60sgbxwpzky61kz";
      }
      
      {
        name = "go";
        publisher = "golang";
        version = "0.37.1";
        sha256 = "0z81mi7x3w1pd4n7prnzm3dy05s2fx8crkc7il60k0qw95aqrs64";
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
        version = "0.6.36";
        sha256 = "0fkrjcw3kiggdqd81v03q80mgdv6ykckpi25mcj9jp4vz027dgg3";
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
        version = "0.0.36";
        sha256 = "0v2xqry7pgwnzxi534v2rrbkfz9gvvbyc2px2g0xpbaaz3rrz6kd";
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
        version = "1.0.4121051";
        sha256 = "1xgbrzw2r8q97gfc02nn276ghqff2hj2jpryapw8rnwbdj04p7g5";
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
        version = "2023.2.43";
        sha256 = "033lg3rzwpjpq8q131x464vnk8jps5w6hwr1z3lgdkc3ljz755kq";
      }
      
      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2023.2.1000561009";
        sha256 = "04z4ykkzdnan0dwmbcd8s4snc76asm2y9mzpdamazwhvrw56fwc7";
      }
      
      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.281.0";
        sha256 = "1n0c7mr9pa5lvsc372vxx8j99ig0i90a56gjal96pqizmfi8ddpp";
      }
      
      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.97.2023022415";
        sha256 = "0vrf83vj83wra4zaznx34icgni33bs083cqfr8kq6pw5snrz72sy";
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
        version = "1.14.14";
        sha256 = "1zykdn1vm1pgz842ld5g7jrm2vin9if47ja6xpq2mxn5j6bap1qv";
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
        version = "1.0.5832";
        sha256 = "1saa615yrhqildlji3f3wsq87r5fdbamdi15hg377ssxxw5snsxw";
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
        version = "1.16.2023022403";
        sha256 = "sha256-C5/HyzRIqh4rIaa7llTnjx3xhElZPR/aZm/zYwPmpd4=";
      }
      
      {
        name = "r";
        publisher = "REditorSupport";
        version = "2.7.1";
        sha256 = "0iljqzmcz5jgmr0rzy3j00my3nnymqbhf1zvfrb96qy3qxpknjgs";
      }
      
      {
        name = "rust-analyzer";
        publisher = "rust-lang";
        version = "0.4.1417";
        sha256 = "01l4j2vhyz7yryb5k6g28xcpaw5mbb06pj01mc8ffyn9m7rvp4l7";
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
        version = "0.48.2023021407";
        sha256 = "1ihipaacqdymazz8hng55lk8dd32dqy4dvfzdrbnlanj0vx1dzp2";
      }
      
      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.25.2023021400";
        sha256 = "0k68f6andbd4ydlyz0c45bcigzbylcv197jzipcdj7z98p4d1r6r";
      }
      
      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.37.2023021802";
        sha256 = "0l0r55g2zqf1i3n2i6b152pax1k2macasdn6lv539irv8bkn3lcb";
      }
      
      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.40.2023020103";
        sha256 = "1dgagzk61i5v6wby673x3wsdm8v803lrifwlpy8dnsmz97gasjvl";
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
