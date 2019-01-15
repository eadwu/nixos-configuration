self: super:

let
  vscodeInsiders = (super.vscode.override {
    isInsiders = true;
  }).overrideAttrs(oldAttrs: rec {
    name = "vscode-insiders-${version}";
    version = "1547446885";

    # wget --spider "https://vscode-update.azurewebsites.net/latest/linux-x64/insider"
    src = self.pkgs.fetchurl {
      name = "VSCode_latest_linux-x64.tar.gz";
      url = "https://az764295.vo.msecnd.net/insider/2ab82c12ed809fd1df921d016eed344a18a9ee8f/code-insider-${version}.tar.gz";
      sha256 = "0h5bp1zzzy9qpsp8i92lf53i5455hc938nxqn8anl2j0sa8w9nf5";
    };
  });
in {
  vscode = (super.vscode-with-extensions.overrideAttrs (oldAttrs: {
    name = vscodeInsiders.name;
  })).override {
    vscode = vscodeInsiders;
    vscodeExtensions = with super.vscode-extensions; [
      ms-python.python
      ms-vscode.cpptools
      WakaTime.vscode-wakatime
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vsc-material-theme";
        publisher = "Equinusocio";
        version = "2.6.3";
        sha256 = "1ghqp0yfcpcnjcwgvxw7aix9fj5q8kr0i97lmzlw2jqslmyvxg5x";
      }

      {
        name = "Ionide-FAKE";
        publisher = "Ionide";
        version = "1.2.3";
        sha256 = "0ijgnxcdmb1ij3szcjlyxs2lb1kly5l26lg9z2fa7hfn67rrds29";
      }

      {
        name = "Ionide-Paket";
        publisher = "Ionide";
        version = "1.12.0";
        sha256 = "10ik4jhvh05363swdfnr7phlnsndypaq3bkrl612z2kvv38q5kl7";
      }

      {
        name = "Ionide-fsharp";
        publisher = "Ionide";
        version = "3.30.0";
        sha256 = "0ig9zmbyfmxvjfjnn1f108vpij9q3qzh74b3gwr12kziiy3qmiyi";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "5.19.0";
        sha256 = "0gk791h4g3ymdfn1ylpkaxxp5ln93a1kc940s1msl619cclk7fpi";
      }

      {
        name = "vscode-docker";
        publisher = "PeterJausovec";
        version = "0.5.1";
        sha256 = "10ja2addwp7rhf6cbz8s24pdap6hm8p43rdl2fnvwn56lln90fwj";
      }

      {
        name = "better-comments";
        publisher = "aaron-bond";
        version = "2.0.3";
        sha256 = "1v6j1blh00y3wr1lawqacvclh4r99vf8h8vjqw4p2y1mv5kh0xk5";
      }

      {
        name = "vscode-sqlite";
        publisher = "alexcvzz";
        version = "0.3.3";
        sha256 = "1v6vw3yyj9rsg1598j712w0w7996w7n6pw6ppwjg9q2znvqvw1g3";
      }

      {
        name = "Nix";
        publisher = "bbenoist";
        version = "1.0.1";
        sha256 = "0zd0n9f5z1f0ckzfjr38xw2zzmcxg1gjrava7yahg5cvdcw6l35b";
      }

      {
        name = "solargraph";
        publisher = "castwide";
        version = "0.19.1";
        sha256 = "1gv7ajayqgh2hslqgcip34qinp1bqrnw07a776jvxrlagyrhlijb";
      }

      {
        name = "path-intellisense";
        publisher = "christian-kohler";
        version = "1.4.2";
        sha256 = "0i2b896cnlk1d23w3jgy8wdqsww2lz201iym5c1rqbjzg1g3v3r4";
      }

      {
        name = "vscode-eslint";
        publisher = "dbaeumer";
        version = "1.8.0";
        sha256 = "0mk1ijbrkj0h3g5pm95arh3aka4jz47zzr8m81055h8q6xsj0rzm";
      }

      {
        name = "githistory";
        publisher = "donjayamanne";
        version = "0.4.4";
        sha256 = "18cha01n29dgysch2diyszjwpf9fpvpzpihikm1kps953d8blvnd";
      }

      {
        name = "jupyter";
        publisher = "donjayamanne";
        version = "1.1.4";
        sha256 = "02ldh8p6sd9x83j7xvs1lp4caxnrnxkrsixig9gadqfxh12p24cy";
      }

      {
        name = "gitlens";
        publisher = "eamodio";
        version = "9.4.1";
        sha256 = "15a39p8wj84hypz0m25chrnqz3zyg4wjnx9z1vv3qqpppybqy2w8";
      }

      {
        name = "tslint";
        publisher = "eg2";
        version = "1.0.42";
        sha256 = "1ia4l9d5sfr0mhjh5pn2g9bh2bs2ygcdwjbl8874g5a7z1v10rn1";
      }

      {
        name = "auto-rename-tag";
        publisher = "formulahendry";
        version = "0.0.15";
        sha256 = "1hgd7y8fyzrphn166vmmsm9kqcl7n8gw4xi8rd24imwbswvh0mgi";
      }

      {
        name = "horizon-theme-vscode";
        publisher = "jolaleye";
        version = "1.6.3";
        sha256 = "0b1wn2cmg40pnk68lq1ggcfrfcgaqhzxpf689kq9bklvjf73krp2";
      }

      {
        name = "language-haskell";
        publisher = "justusadam";
        version = "2.5.0";
        sha256 = "10jqj8qw5x6da9l8zhjbra3xcbrwb4cpwc3ygsy29mam5pd8g6b3";
      }

      {
        name = "vscode-language-babel";
        publisher = "mgmcdermott";
        version = "0.0.21";
        sha256 = "183wiz1sa2656zjq2vwlrpz59zi6q2cij2w35mh7q2hh0wpjpcpl";
      }

      {
        name = "vscode-clang";
        publisher = "mitaki28";
        version = "0.2.3";
        sha256 = "0xbg2frb4dxv7zl43gi25w2mkkh4xq2aidcf5i8b4imys9h720yr";
      }

      {
        name = "vscode-filesize";
        publisher = "mkxml";
        version = "2.1.1";
        sha256 = "03sywm0pi777syy1k4a76wpiqaky8mk7asr4wnq9fd71327481wn";
      }

      {
        name = "azure-account";
        publisher = "ms-vscode";
        version = "0.8.0";
        sha256 = "11z4f9vdj8vq0pz4j2zpc0mlhb1kgvn89c25is50kh44qwds13h7";
      }

      {
        name = "vs-keybindings";
        publisher = "ms-vscode";
        version = "0.2.0";
        sha256 = "176xvqcaf3ls5sa1ldb0iyv6hi5d6fmcam1a3gkdk6m5na6vfca8";
      }

      {
        name = "vsliveshare";
        publisher = "ms-vsliveshare";
        version = "0.3.1100";
        sha256 = "0rlihfx08hlwfbd7j6k2sri2wwzr9yap8c6yg1ijl1mlkmjc7rr6";
      }

      {
        name = "debugger-for-chrome";
        publisher = "msjsdiag";
        version = "4.11.1";
        sha256 = "17axv1fasmxxka8g4x207gs83vsyqx4xh51d2iy331v6yhlxkbl3";
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
        version = "0.21.0";
        sha256 = "06ww2drq1z5ff3d07d7c5cvc0lhxh7y5958cljvw7y1a5nl9f8ba";
      }

      {
        name = "java";
        publisher = "redhat";
        version = "0.36.0";
        sha256 = "1clxw9xbbbdxivysddcfz2xijlhxancpyw19dcxcjb0nx3n64lis";
      }

      {
        name = "rust";
        publisher = "rust-lang";
        version = "0.5.3";
        sha256 = "0nkf6cg1hmmsrvryjs5r0pdwsilfmrmy44wz47jjygyy62ixcad9";
      }

      {
        name = "stylelint";
        publisher = "shinnn";
        version = "0.47.0";
        sha256 = "0z3p6cz7lxvdd013s4dydhixsvb4d1wzmhsrv1g1w02jd4kmxd87";
      }

      {
        name = "shader";
        publisher = "slevesque";
        version = "1.1.4";
        sha256 = "0m5ld6l5sizqbj2k6754n2hn50ygajy464qz66dar2n3nhvjdv9n";
      }

      {
        name = "cmake";
        publisher = "twxs";
        version = "0.0.17";
        sha256 = "11hzjd0gxkq37689rrr2aszxng5l9fwpgs9nnglq3zhfa1msyn08";
      }

      {
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.16.0";
        sha256 = "0mgkwkcw31lk6arvs7az9jak9vs6mwdz9vkw9f2rdj0fck4mlryz";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.5.0";
        sha256 = "0nfjj3zm0xbsz6v0qcy8kc47arg12svn4bw6p6lz5dd2hq9wmg90";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.13.0";
        sha256 = "16wn4czkjy5lkp5sqq55cpni636kdsm9qp1dk1r4156l227p6xq2";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.13.0";
        sha256 = "0vg96nw9cxlcgwa56mfiml377452zd10w6gd6gd0md2fib92ck6k";
      }
    ];
  };
}
