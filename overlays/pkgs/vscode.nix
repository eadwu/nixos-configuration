self: super:

let
  vscodeInsiders = (super.vscode.override {
    isInsiders = true;
  }).overrideAttrs(oldAttrs: rec {
    name = "vscode-insiders-${version}";
    version = "1544768411";

    # wget --spider "https://vscode-update.azurewebsites.net/latest/linux-x64/insider"
    src = self.pkgs.fetchurl {
      name = "VSCode_latest_linux-x64.tar.gz";
      url = "https://az764295.vo.msecnd.net/insider/ece3a90fb58986570d8afdfb16530c4dd8c743af/code-insider-${version}.tar.gz";
      sha256 = "14jq57g4ryjjvm06lm9858qm9mizg95hxx8h1f1nn9777pcdrqyw";
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
        name = "better-comments";
        publisher = "aaron-bond";
        version = "2.0.3";
        sha256 = "1v6j1blh00y3wr1lawqacvclh4r99vf8h8vjqw4p2y1mv5kh0xk5";
      }

      {
        name = "vscode-sqlite";
        publisher = "alexcvzz";
        version = "0.3.2";
        sha256 = "0975k9jkn7ba7y6yvkdq3l22b5mj9yjihhsijv8r1l9ibfaz2i4b";
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
        version = "0.18.0";
        sha256 = "1p61fklqpzq97k4imcnbcbz6kfg80wjnb7fhdcqh2lnxw3cm4zv3";
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
        version = "1.7.2";
        sha256 = "1czq88rb7db8j7xzv1dsx8cp42cbsg7xwbwc68waq5md14wx0ggr";
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
        version = "9.2.1";
        sha256 = "02i5hpwpz4k6pkcyd9wxg2y5yslhp7jvpg4z86dy575s9ifz65pz";
      }

      {
        name = "tslint";
        publisher = "eg2";
        version = "1.0.41";
        sha256 = "07jw33ngc2r226ww5cb4pjdmwsycv3ppsc768wzg8c5xic5hjqvj";
      }

      {
        name = "vsc-material-theme";
        publisher = "Equinusocio";
        version = "2.6.2";
        sha256 = "115xj5r3ms28jxq3s7qb0zxrvkdsbgyvrkrkf7cc1jljcybvsimc";
      }

      {
        name = "auto-rename-tag";
        publisher = "formulahendry";
        version = "0.0.15";
        sha256 = "1hgd7y8fyzrphn166vmmsm9kqcl7n8gw4xi8rd24imwbswvh0mgi";
      }

      {
        name = "Ionide-FAKE";
        publisher = "Ionide";
        version = "1.2.3";
        sha256 = "0ijgnxcdmb1ij3szcjlyxs2lb1kly5l26lg9z2fa7hfn67rrds29";
      }

      {
        name = "Ionide-fsharp";
        publisher = "Ionide";
        version = "3.30.0";
        sha256 = "0ig9zmbyfmxvjfjnn1f108vpij9q3qzh74b3gwr12kziiy3qmiyi";
      }

      {
        name = "Ionide-Paket";
        publisher = "Ionide";
        version = "1.12.0";
        sha256 = "10ik4jhvh05363swdfnr7phlnsndypaq3bkrl612z2kvv38q5kl7";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "5.18.0";
        sha256 = "13vg5a5740gd99f83vv82rn0rrzp9089v5qd3a8fsq4zjlcl29k4";
      }

      {
        name = "horizon-theme-vscode";
        publisher = "jolaleye";
        version = "1.6.2";
        sha256 = "1dbblpsf66nyrzhmzpmxg133f3308j3f2yp5f0z8kahnhch7hw3p";
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
        version = "0.7.0";
        sha256 = "1g8dla4w7jdzb0nbqsq75x3dqc6w3vr4cl6z95ccisayq25b36ic";
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
        version = "0.3.1071";
        sha256 = "0j6nny54isff1xl8z0zhhj7gvp2s353kfv6bf40c1c8n469mf0ca";
      }

      {
        name = "debugger-for-chrome";
        publisher = "msjsdiag";
        version = "4.11.1";
        sha256 = "17axv1fasmxxka8g4x207gs83vsyqx4xh51d2iy331v6yhlxkbl3";
      }

      {
        name = "vscode-docker";
        publisher = "PeterJausovec";
        version = "0.4.0";
        sha256 = "1inlks69hbln221d1g06bxl1r9f13pknw9394wyg6ffhl6fs86ri";
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
        version = "0.35.0";
        sha256 = "1dszdzs52x8ihf7x64nv6xb74q6gq6pc10mxhrzdh4vhdrb1rspw";
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
        version = "0.12.0";
        sha256 = "0iakkjl6q5gx25kx4axh7m0vagjnhg3891fy48yj1dgzq2x5qsv5";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.11.3";
        sha256 = "139hbrcx6j27m5ssvm1h8nmri4kyxy39dhn3yla27ix97vpd0ph0";
      }
    ];
  };
}
