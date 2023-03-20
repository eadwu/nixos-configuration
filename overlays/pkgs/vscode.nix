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
        version = "2023.3.1805";
        sha256 = "14dv5dg1abn9gm597xyzj97dyis30b18p1ycwwqa0v7abxxwvjdm";
      }
      
      {
        name = "vsc-material-theme";
        publisher = "Equinusocio";
        version = "33.7.0";
        sha256 = "1b40vhla343gsn0y66iphsgxhka9p1sc18jnq9zr732gqziyw2db";
      }
      
      {
        name = "vsc-material-theme-icons";
        publisher = "equinusocio";
        version = "2.7.3";
        sha256 = "11zbcz6xil2ynychlbc1sdfzqfb4884qbgvxq8kii4xdwgc57ap1";
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
        version = "1.78.9758";
        sha256 = "028di2bayvabm0y9qbhrpar8jgbld304qr7vz8pp6yljplrrm1m8";
      }
      
      {
        name = "vscode-pull-request-github";
        publisher = "GitHub";
        version = "0.61.2023031710";
        sha256 = "1zw95f7dci6yrrn41v3fg424vwvs89bpaqgca5ja0b9995n5h9nw";
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
        version = "9.7.0";
        sha256 = "0gkgzd1z1y1acnd0a15m3h43i38pnf60wpl4vjcw09qfx84ahlk3";
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
        version = "1.43.1";
        sha256 = "1q1mvbl7g0y8vbj55r2gj5fqp5fz5ycvaiwhmb2ahk568rpg4vch";
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
        version = "1.0.4165021";
        sha256 = "1y97wann7kwsd94a7hfvb8b0y92b7qw3a1hjgy224lvqkdrhg49z";
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
        version = "2023.3.25";
        sha256 = "1x2n2h6x345hk04bw95q235kly46xy3xv3z7xrda8qjavcj8831f";
      }
      
      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2023.3.1000810123";
        sha256 = "1r9gblnla7p9mnw16jg2dg3s6bkd4r05sc45yxdzamnnrclrs570";
      }
      
      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.285.0";
        sha256 = "0bg336vwiwbbzpjm4g1gra7qdd7gch7d13h6iv7lnvbl1h9plyjh";
      }
      
      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.99.2023031515";
        sha256 = "1pm1a4m1x9x6s4669jhl756acbzi608lqfzzhhhy7fvp8hjd1gjz";
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
        version = "1.14.17";
        sha256 = "08nk48kjxiz64ya8fx180bdvb3p726f1iycvb8hzgfzvlqcklcdx";
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
        version = "1.17.2023031704";
        sha256 = "sha256-zmt9l0xbdwa+mGoOjubMjofcHiDY8u6oXnVZj/U84rI=";
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
        version = "0.4.1442";
        sha256 = "1xmz9r3fq8ghnk7lbvhy1576awnmd5rs3w4xq2yk4gv2x3dlm9x1";
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
        version = "3.8.0";
        sha256 = "1xynr360i9z2dyd13rq2fkjgvfsc82q0ch8rwk0nznw2nw8i6rjg";
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
        version = "0.25.2023031705";
        sha256 = "129gpcnr79ara96vybdcwzzd9cxzzddcqmjlp74y1x0q5z2bs4kx";
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
        version = "0.40.2023031703";
        sha256 = "1dja3f4fcy35fih20rr3n864wzqxy29hgjk23j3n4ipv1dxj25vy";
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
