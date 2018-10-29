self: super:

{
  vscode = (super.vscode-with-extensions.overrideAttrs (oldAttrs: {
    name = super.vscode.name;
  })).override {
    vscode = super.vscode;
    vscodeExtensions = with super.vscode-extensions; [
      bbenoist.Nix
      ms-vscode.cpptools
      ms-python.python
      WakaTime.vscode-wakatime
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "better-comments";
        publisher = "aaron-bond";
        version = "2.0.2";
        sha256 = "0c36wpk4skk0ncbscq86qrizddjgmv9v0xs2jbmb1hdp6fw9p19d";
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
        version = "1.6.1";
        sha256 = "10zhrp73rhmv226x2zfah0wzy70k180y24smkijd3cjjg1yhfh7k";
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
        name = "prettier-vscode";
        publisher = "esbenp";
        version = "1.6.1";
        sha256 = "04nq5r1s5kacqfn7vrsdwps4jr58nnvm9hrircnp2mp94wal9wsj";
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
        version = "5.13.0";
        sha256 = "1wykiwv2k3adpjq4d4fnpilw5g3q2h2f9f8g5dqchdm1iw8r0gwx";
      }

      {
        name = "horizon-theme-vscode";
        publisher = "jolaleye";
        version = "1.5.1";
        sha256 = "1cvwsvcs0fjv09plpg6x6nj7z28v6a7m2h2vjlxn82hmaw7hl951";
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
        version = "0.4.3";
        sha256 = "149cc99a2502svi55zpfmngl3dsw7kji45vsgpzwh6559szzd2fq";
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
        version = "0.3.869";
        sha256 = "033dqqds7yhqq9qviaznbzcakf3byz56np0fzpdpfpg818gizal4";
      }

      {
        name = "debugger-for-chrome";
        publisher = "msjsdiag";
        version = "4.10.2";
        sha256 = "00lnxbdsb24jl4dblwavshwkpn72n95fgh2x58fnmf5hfr7h6jx8";
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
        name = "code-settings-sync";
        publisher = "Shan";
        version = "3.2.0";
        sha256 = "1m5x0h06wggp8150gjhpsn8hrqwfrnzqqqkjbd5bakbdvi5njwlc";
      }

      {
        name = "stylelint";
        publisher = "shinnn";
        version = "0.44.0";
        sha256 = "1m2vi7a1ign162a7z2miga749pbqrx5c66bzm3v5xbihq23kwfsw";
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
        version = "0.14.0";
        sha256 = "1p0nlb3sd0npiw9095i9kwlf01jjfidy0ka4midnihcnl5cirn2f";
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
