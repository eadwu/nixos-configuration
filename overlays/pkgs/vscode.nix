self: super:

{
  vscode = (super.vscode.override {
    isInsiders = true;
  }).overrideAttrs(_: rec {
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
        version = "30.0.0";
        sha256 = "0gkd24jiwgb7mmfrw8iwwl1abz675cpxjn6bfahlql07pyp8y4xc"; }

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
        version = "4.0.6";
        sha256 = "1wrr45sklsb1741hj1q9fy3qxchxw7xpiwhq3s7vhcjywmfkjl7g"; }

      { name = "latex-workshop";
        publisher = "James-Yu";
        version = "8.0.7";
        sha256 = "0ysb7nvb6gdx7bjnxhqn8hrqhik6q9a539wlas4lmp6sh6pxmyim"; }

      { name = "better-comments";
        publisher = "aaron-bond";
        version = "2.0.5";
        sha256 = "0wrkiwd98n5zm59g37mz4za8d17dabdf3yqm5jk0js90irj706pv"; }

      { name = "vscode-hie-server";
        publisher = "alanz";
        version = "0.0.28";
        sha256 = "1gfwnr5lgwdgm6hs12fs1fc962j9hirrz2am5rmhnfrwjgainkyr"; }

      { name = "vscode-sqlite";
        publisher = "alexcvzz";
        version = "0.8.0";
        sha256 = "0s1lzp4vzwpi7d85c7bnf5y3cx4snnn9bdnf1fb7j0p2hdhrzll6"; }

      { name = "Nix";
        publisher = "bbenoist";
        version = "1.0.1";
        sha256 = "0zd0n9f5z1f0ckzfjr38xw2zzmcxg1gjrava7yahg5cvdcw6l35b"; }

      { name = "solargraph";
        publisher = "castwide";
        version = "0.21.1";
        sha256 = "15dy6pg4cm0marj5wf5swqk60vmm0xbz284r26jhyn2jai8ccb33"; }

      { name = "path-intellisense";
        publisher = "christian-kohler";
        version = "1.4.2";
        sha256 = "0i2b896cnlk1d23w3jgy8wdqsww2lz201iym5c1rqbjzg1g3v3r4"; }

      { name = "vscode-eslint";
        publisher = "dbaeumer";
        version = "1.9.1";
        sha256 = "0q3vnqmik1228zsy7favzsr3xpaci3z1zh38m79cpy5rac5bcr62"; }

      { name = "githistory";
        publisher = "donjayamanne";
        version = "0.4.6";
        sha256 = "1wj838iv1xg25a604j4mccdcqhjjcgpaaq6yhnng1ph0s16ypin1"; }

      { name = "gitlens";
        publisher = "eamodio";
        version = "9.9.3";
        sha256 = "04rns3bwc9cav5rdk5bjm6m0lzjqpm9x99539bhk319l83ksffyv"; }

      { name = "tslint";
        publisher = "eg2";
        version = "1.0.44";
        sha256 = "11q8kmm7k3pllwgflsjn20d1w58x3r0vl3i2b32bnbk2gzwcjmib"; }

      { name = "vsc-material-theme-icons";
        publisher = "equinusocio";
        version = "1.0.6";
        sha256 = "1xccg318bybfxz8gc56sfk9aqnfpigc64kczgbffaklp2fzcws9q"; }

      { name = "auto-rename-tag";
        publisher = "formulahendry";
        version = "0.1.0";
        sha256 = "1zcxcf269jbwpsa29mlmfs3z8awbsccrq595m6chqrspnw2l8a2b"; }

      { name = "language-haskell";
        publisher = "justusadam";
        version = "2.6.0";
        sha256 = "1891pg4x5qkh151pylvn93c4plqw6vgasa4g40jbma5xzq8pygr4"; }

      { name = "noctis";
        publisher = "liviuschera";
        version = "10.5.0";
        sha256 = "0fydy1842gbpq4357fbp6m5r6blk28y61azdpjc1vyjigakj38i4"; }

      { name = "vscode-language-babel";
        publisher = "mgmcdermott";
        version = "0.0.23";
        sha256 = "1h7xs0kx5z1qya31s09whqk4005i3ipxp1zw8r2snbr3rfnsiw0f"; }

      { name = "vscode-clang";
        publisher = "mitaki28";
        version = "0.2.3";
        sha256 = "0xbg2frb4dxv7zl43gi25w2mkkh4xq2aidcf5i8b4imys9h720yr"; }

      { name = "vscode-filesize";
        publisher = "mkxml";
        version = "2.1.3";
        sha256 = "019nq40al1grz0q6w9vsjry92rc7aq73mbhial4wv3bdmglnjg8s"; }

      { name = "vscode-docker";
        publisher = "ms-azuretools";
        version = "0.7.0";
        sha256 = "0bgs6dy429m5yn10dd8m321slf5mqgsbr86ip61kvjwh67q9glcr"; }

      { name = "pyright";
        publisher = "ms-pyright";
        version = "1.0.57";
        sha256 = "1b7k5015xcf3psdaivpis4ii92bkkbdzsn8w5pqw2nyzapvbyk0m"; }

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
        version = "1.0.721";
        sha256 = "0pa9q1jkz14vjmxcxdwnn5y0xb1yfgq7i57kd1walgmzisvlainf"; }

      { name = "debugger-for-chrome";
        publisher = "msjsdiag";
        version = "4.11.7";
        sha256 = "11nsl98aqmw4a1s1v33ljk66kr8gi41pvvbc51v4fvbwk0r1xdx0"; }

      { name = "quicktype";
        publisher = "quicktype";
        version = "12.0.46";
        sha256 = "0mzn1favvrzqcigr74gmy167qak5saskhwcvhf7f00z7x0378dim"; }

      { name = "ruby";
        publisher = "rebornix";
        version = "0.24.2";
        sha256 = "1qyjh57k89b90db97qfhqzjbmqpkqpv6il0gv09djamv80mw9wd9"; }

      { name = "java";
        publisher = "redhat";
        version = "0.47.0";
        sha256 = "06wv22j9chzfm8z5qsphhp2siyxh6fn34x9fkfz1iz4lpc26hyc2"; }

      { name = "rust";
        publisher = "rust-lang";
        version = "0.6.1";
        sha256 = "0f66z6b374nvnrn7802dg0xz9f8wq6sjw3sb9ca533gn5jd7n297"; }

      { name = "jinjahtml";
        publisher = "samuelcolvin";
        version = "0.10.5";
        sha256 = "1mv2zkp09dgqdvvr42mwajm0cninqqw2g2adi5b5ki63niv5xx2y"; }

      { name = "scala";
        publisher = "scala-lang";
        version = "0.3.4";
        sha256 = "1p2ldayaxyz9q7azlwi9b25a37d6w03q4yrzdpmixklxj5d67pch"; }

      { name = "metals";
        publisher = "scalameta";
        version = "1.5.2";
        sha256 = "0jda4a41swazg53w3p70cb6w8d11hlisfnkl2rfg4my37cqx6yy5"; }

      { name = "stylelint";
        publisher = "shinnn";
        version = "0.51.0";
        sha256 = "0qxa6jcfjl9vkx06shxjpa8k99ysvar3i0pzqdnc4aizjcayn3i4"; }

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
        version = "0.21.0";
        sha256 = "0gxrz8w97ksrqyim62hx02rfq91dvw4msn5a4mqd5kw27gqfc26x"; }

      { name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.7.1";
        sha256 = "0mrsxgaca0nlgs3j2hvpzx99qiak1dk9sz95bm6ihs0m8ba6zyd4"; }

      { name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.19.0";
        sha256 = "0nb2pkdijyk9k1981mnrxng2sn7sq2v2waw75cp68j3mjg597l22"; }

      { name = "vscode-maven";
        publisher = "vscjava";
        version = "0.18.2";
        sha256 = "15gnxli7flvvbfbkqslmw63ykfjgbccmfml32rfjv7418fdljdz1"; }
    ];
  };
}
