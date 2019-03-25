self: super:

{
  vscode = (super.vscode.override {
    isInsiders = true;
  }).overrideAttrs(oldAttrs: rec {
    name = "${pname}-${version}";
    pname = "vscode-insiders";
    version = "nightly";

    src = builtins.fetchurl {
      name = "VSCode_latest_linux-x64.tar.gz";
      url = "https://vscode-update.azurewebsites.net/latest/linux-x64/insider";
    };
  });

  vscode-with-extensions = super.vscode-with-extensions.override {
    vscodeExtensions = with super.vscode-extensions; [
      ms-python.python
      ms-vscode.cpptools
      WakaTime.vscode-wakatime
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      { name = "vsc-material-theme";
        publisher = "Equinusocio";
        version = "2.8.2";
        sha256 = "04hixd2bv7dd46pcs4mflr7xzfz273zai91k67jz6589bd8m93av"; }

      { name = "Ionide-FAKE";
        publisher = "Ionide";
        version = "1.2.3";
        sha256 = "0ijgnxcdmb1ij3szcjlyxs2lb1kly5l26lg9z2fa7hfn67rrds29"; }

      { name = "Ionide-Paket";
        publisher = "Ionide";
        version = "1.12.0";
        sha256 = "10ik4jhvh05363swdfnr7phlnsndypaq3bkrl612z2kvv38q5kl7"; }

      { name = "Ionide-fsharp";
        publisher = "Ionide";
        version = "3.34.0";
        sha256 = "0wwqnhc6hx50h4il78zbf83xkqswya906drf4nw2cyl1qmjbb271"; }

      { name = "latex-workshop";
        publisher = "James-Yu";
        version = "6.2.2";
        sha256 = "00y5argh0qfmcchj4kbvinlpcacip0ngk3nc5x9m50x6lvlha0wp"; }

      { name = "vscode-docker";
        publisher = "PeterJausovec";
        version = "0.6.1";
        sha256 = "0clxy66qi5c3k5di5xsjm3vjib525xq89z1q2h3a5x5qwvbvd0mj"; }

      { name = "better-comments";
        publisher = "aaron-bond";
        version = "2.0.3";
        sha256 = "1v6j1blh00y3wr1lawqacvclh4r99vf8h8vjqw4p2y1mv5kh0xk5"; }

      { name = "vscode-hie-server";
        publisher = "alanz";
        version = "0.0.25";
        sha256 = "0m21w03v94qxm0i54ki5slh6rg7610zfxinfpngr0hfpgw2nnxvc"; }

      { name = "vscode-sqlite";
        publisher = "alexcvzz";
        version = "0.6.0";
        sha256 = "07sbrn9jsk0jnqqjn0f0zjhdgwbspzrmg3qazz3qrlwvr564qb14"; }

      { name = "Nix";
        publisher = "bbenoist";
        version = "1.0.1";
        sha256 = "0zd0n9f5z1f0ckzfjr38xw2zzmcxg1gjrava7yahg5cvdcw6l35b"; }

      { name = "solargraph";
        publisher = "castwide";
        version = "0.19.3";
        sha256 = "0l72b3fksxkqi36cdnvn0h1l8lznsa9k84ijaw3ms81d02nh368n"; }

      { name = "path-intellisense";
        publisher = "christian-kohler";
        version = "1.4.2";
        sha256 = "0i2b896cnlk1d23w3jgy8wdqsww2lz201iym5c1rqbjzg1g3v3r4"; }

      { name = "vscode-eslint";
        publisher = "dbaeumer";
        version = "1.8.2";
        sha256 = "0jlz4z77ggz17ml58ycpmdk9hzx5hgsn0c8j8jgcnjm07w43yl28"; }

      { name = "githistory";
        publisher = "donjayamanne";
        version = "0.4.6";
        sha256 = "1wj838iv1xg25a604j4mccdcqhjjcgpaaq6yhnng1ph0s16ypin1"; }

      { name = "gitlens";
        publisher = "eamodio";
        version = "9.5.1";
        sha256 = "10s2g98wv8i0w6fr0pr5xyi8zmh229zn30jn1gg3m5szpaqi1v92"; }

      { name = "tslint";
        publisher = "eg2";
        version = "1.0.43";
        sha256 = "0p0lvkip083vx1y5p53ksy9457x76ylxlc2kf7zdb09vqm6ss8z3"; }

      { name = "vsc-material-theme-icons";
        publisher = "equinusocio";
        version = "0.12.0";
        sha256 = "1g15pqmy1i7brby049i6ci4spz5apshhs1vbnpnfimq4gsa5115i"; }

      { name = "auto-rename-tag";
        publisher = "formulahendry";
        version = "0.0.15";
        sha256 = "1hgd7y8fyzrphn166vmmsm9kqcl7n8gw4xi8rd24imwbswvh0mgi"; }

      { name = "horizon-theme-vscode";
        publisher = "jolaleye";
        version = "1.8.0";
        sha256 = "1vj9cbqir177m4wgl1jlyckjfspcydc4klh64zym9ln0sz6n9l5l"; }

      { name = "language-haskell";
        publisher = "justusadam";
        version = "2.5.0";
        sha256 = "10jqj8qw5x6da9l8zhjbra3xcbrwb4cpwc3ygsy29mam5pd8g6b3"; }

      { name = "vscode-language-babel";
        publisher = "mgmcdermott";
        version = "0.0.22";
        sha256 = "12757hwsz5fg89a89lg1rsin06dpsqq6ix1skjgw4qq89kq3zry1"; }

      { name = "vscode-clang";
        publisher = "mitaki28";
        version = "0.2.3";
        sha256 = "0xbg2frb4dxv7zl43gi25w2mkkh4xq2aidcf5i8b4imys9h720yr"; }

      { name = "vscode-filesize";
        publisher = "mkxml";
        version = "2.1.2";
        sha256 = "09x394pp4231fjw9mvrp332jw21n7dw9r68cbph526mhhdjnj81i"; }

      { name = "azure-account";
        publisher = "ms-vscode";
        version = "0.8.10";
        sha256 = "02hra09501xl08xwinnry4pgl8p9y8j5ars5h20amz5h7xvs8y58"; }

      { name = "vs-keybindings";
        publisher = "ms-vscode";
        version = "0.2.0";
        sha256 = "176xvqcaf3ls5sa1ldb0iyv6hi5d6fmcam1a3gkdk6m5na6vfca8"; }

      { name = "vsliveshare";
        publisher = "ms-vsliveshare";
        version = "0.3.1326";
        sha256 = "0vd5ikq3py7xxnahirqkrz1da7r5r3pbd4lkrw3hkn3hddk3g2ir"; }

      { name = "debugger-for-chrome";
        publisher = "msjsdiag";
        version = "4.11.3";
        sha256 = "1i5skl12pdd1f5diday0prihdd99kdvcv3www3zrkpvxkpyp8v9a"; }

      { name = "quicktype";
        publisher = "quicktype";
        version = "12.0.46";
        sha256 = "0mzn1favvrzqcigr74gmy167qak5saskhwcvhf7f00z7x0378dim"; }

      { name = "ruby";
        publisher = "rebornix";
        version = "0.22.3";
        sha256 = "1jlhz6nsdi7ifq29h308zgrll88nwk1kwdxv09y90hcsrvsn41ag"; }

      { name = "java";
        publisher = "redhat";
        version = "0.41.0";
        sha256 = "0sh9rl4skcvzp50485vi9w1sicvbz9lrnjmw15a99vfjr51hl1q8"; }

      { name = "rust";
        publisher = "rust-lang";
        version = "0.5.4";
        sha256 = "1l4m31b4n4gwrfdk008ygj2yzb225kdm44hf7bj6rc7w6qzic2mj"; }

      { name = "stylelint";
        publisher = "shinnn";
        version = "0.48.0";
        sha256 = "1i8vp555niqaga9n6x1xy57r3dcyk7qz9b4jr67zlg3c8jwh5la0"; }

      { name = "shader";
        publisher = "slevesque";
        version = "1.1.4";
        sha256 = "0m5ld6l5sizqbj2k6754n2hn50ygajy464qz66dar2n3nhvjdv9n"; }

      { name = "cmake";
        publisher = "twxs";
        version = "0.0.17";
        sha256 = "11hzjd0gxkq37689rrr2aszxng5l9fwpgs9nnglq3zhfa1msyn08"; }

      { name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.17.0";
        sha256 = "1iqy3xv9ljwn3fw8384sjkwpf6584c43yw5bqlc39krqilks31fi"; }

      { name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.6.0";
        sha256 = "0f2zi72aaywib0mjwx3m8420iys0kyn1xl5rapsi4zkjrh94ryxf"; }

      { name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.15.1";
        sha256 = "161l4rhzvqk6rhv9rgc15zisnhz1y27l2j00za9ny7jafp8rs3bf"; }

      { name = "vscode-maven";
        publisher = "vscjava";
        version = "0.15.2";
        sha256 = "1wzf6j4m7dp1v92shxyw1855i1699dvcbydppkzndkyqnmiw74kl"; }
    ];
  };
}
