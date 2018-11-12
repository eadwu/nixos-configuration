self: super:

let
  vscodeInsiders = (super.vscode.override {
    isInsiders = true;
  }).overrideAttrs(oldAttrs: rec {
    name = "vscode-insiders-${version}";
    version = "1541809983";

    # wget --spider "https://vscode-update.azurewebsites.net/latest/linux-x64/insider"
    src = self.pkgs.fetchurl {
      name = "VSCode_latest_linux-x64.tar.gz";
      url = "https://az764295.vo.msecnd.net/insider/5f24c93878bd4bc645a4a17c620e2487b11005f9/code-insider-${version}.tar.gz";
      sha256 = "0dvibkfs2skx90af1z4zhv7q5c11hav74hfvka2sf2n2417hid8i";
    };
  });
in {
  vscode = (super.vscode-with-extensions.overrideAttrs (oldAttrs: {
    name = vscodeInsiders.name;
  })).override {
    vscode = vscodeInsiders;
    vscodeExtensions = with super.vscode-extensions; [
      bbenoist.Nix
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
        version = "0.3.1";
        sha256 = "0r7icvrmb4k1yjbk2c94k6hhssdw61vbmmbddz5gvdq1vwrsfr06";
      }

      {
        name = "solargraph";
        publisher = "castwide";
        version = "0.17.6";
        sha256 = "1n1z9kgygd12120didqnmbsclq4lj041r8amjksfnyi8mg8ysl4r";
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
        version = "1.7.0";
        sha256 = "1jim6kn09wacrv163fwkxlzrf8k1r51mmryzrnm0gx5iz1iv1pha";
      }

      {
        name = "githistory";
        publisher = "donjayamanne";
        version = "0.4.3";
        sha256 = "12vhs0jrzqh1gq38qfq0h3pfpnan01sx4a4ik14hdby0558han9j";
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
        version = "8.5.6";
        sha256 = "1vn6fvxn4g3759pg9rp8hqdc58pgyvcdma1ylfwmdnipga37xfd3";
      }

      {
        name = "tslint";
        publisher = "eg2";
        version = "1.0.40";
        sha256 = "1458rxxga2r3l3p1jbmb1k8bylxcc33fn6v0gd29j44237kv9kk8";
      }

      {
        name = "vsc-material-theme";
        publisher = "Equinusocio";
        version = "2.5.1";
        sha256 = "1qr7zk3qjsp98346r642k54s6jny8fkanac99v3aa7i2k6idpm6g";
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
        version = "3.29.0";
        sha256 = "1nk85iwfdxxf28d2jlw2ddwviyj5yl69q7msym96zgs7qqwlxq4i";
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
        version = "5.15.1";
        sha256 = "1crbqlmwykpvc65c6skhmm4zicpqfv1nc6g685yvb08d3y7asw78";
      }

      {
        name = "horizon-theme-vscode";
        publisher = "jolaleye";
        version = "1.6.0";
        sha256 = "04px1x1hr8w4197048p5l7inbrmkfl5d6rkgr14zifaqbjzkd7br";
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
        name = "vscode-filesize";
        publisher = "mkxml";
        version = "2.1.1";
        sha256 = "03sywm0pi777syy1k4a76wpiqaky8mk7asr4wnq9fd71327481wn";
      }

      {
        name = "azure-account";
        publisher = "ms-vscode";
        version = "0.6.0";
        sha256 = "1zk102pxar2l6dk579h7k5xxpq9kwaycib3syqdd69p4m0fmbi8h";
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
        version = "0.3.925";
        sha256 = "1crxgvg6mcaaldgs3ckisfpdnx1acrd762ib80mikvri8pjy1ac3";
      }

      {
        name = "debugger-for-chrome";
        publisher = "msjsdiag";
        version = "4.11.0";
        sha256 = "0ic6zvikqazqc3cw5ahkjxcx9nwc8yp8q90a8hdff1pbgxbyy4ci";
      }

      {
        name = "vscode-docker";
        publisher = "PeterJausovec";
        version = "0.3.1";
        sha256 = "13rkgc45vk25nphnkjdqrjm1zy32s2v54ycy9vm6kvi9na71fl7d";
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
        version = "0.20.0";
        sha256 = "09p9vc45nq542vlrb6wn5958gmv7dy600i5nxgam78m08k5il2dd";
      }

      {
        name = "java";
        publisher = "redhat";
        version = "0.33.0";
        sha256 = "0fgy34iwdckdkhvhxx19v07cy7501950i69dkgb432dr361cyg99";
      }

      {
        name = "rust";
        publisher = "rust-lang";
        version = "0.4.10";
        sha256 = "1y7sb3585knv2pbq7vf2cjf3xy1fgzrqzn2h3fx2d2bj6ns6vpy3";
      }

      {
        name = "stylelint";
        publisher = "shinnn";
        version = "0.46.0";
        sha256 = "10vkyjp70xfczknb3ny0mglw2hac7q7fs4bsjrj1rrk434mvml21";
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
        version = "0.15.0";
        sha256 = "1p0jf3jf7smf0xxbbzjfj4kg3dq6wxdwilk5b5c7kjd24il210b4";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.4.0";
        sha256 = "1fsayy5yyarasg0w0sgd9ak6vb25m38mr09cj1vjzmmpdac0mg2q";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.10.0";
        sha256 = "1yafcxs3njyxingvw7vxnspx41r8hrk7k3h152wlx53lnlg24603";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.11.1";
        sha256 = "0fz4lmw59czpq0bhszh99nrlnk4j3g598hsjgxxch751vqfmvz2q";
      }
    ];
  };
}
