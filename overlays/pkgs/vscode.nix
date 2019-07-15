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
        version = "29.2.0";
        sha256 = "192x2rblyxgwilyk54anpplxqqwza9445rxsqw78v5ig64yv521j"; }

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
        version = "7.1.0";
        sha256 = "1vz7x5cjn8sy6i6lbvxxsa28pwcrlgb1zpyvd7wa03fl3n0h7nys"; }

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
        version = "0.7.1";
        sha256 = "1cbmpqwiln018dclc2xvnh9hvan2y69m8zjbzigyj2krxxjg0yh6"; }

      { name = "Nix";
        publisher = "bbenoist";
        version = "1.0.1";
        sha256 = "0zd0n9f5z1f0ckzfjr38xw2zzmcxg1gjrava7yahg5cvdcw6l35b"; }

      { name = "solargraph";
        publisher = "castwide";
        version = "0.20.0";
        sha256 = "0dkf30dwjvfzb2v396lmaf9c1j8rnispr8fsjwbykdp3miwlqlca"; }

      { name = "path-intellisense";
        publisher = "christian-kohler";
        version = "1.4.2";
        sha256 = "0i2b896cnlk1d23w3jgy8wdqsww2lz201iym5c1rqbjzg1g3v3r4"; }

      { name = "vscode-eslint";
        publisher = "dbaeumer";
        version = "1.9.0";
        sha256 = "1lr25v236cz8kbgbgqj6izh3f4nwp9cxygpa0zzfvfrg8gg0x49w"; }

      { name = "githistory";
        publisher = "donjayamanne";
        version = "0.4.6";
        sha256 = "1wj838iv1xg25a604j4mccdcqhjjcgpaaq6yhnng1ph0s16ypin1"; }

      { name = "gitlens";
        publisher = "eamodio";
        version = "9.8.5";
        sha256 = "067jhcyy5glx9xqh6k9gkla065wsiic6lkpgfz4xpmjpn81pmva6"; }

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

      { name = "horizon-theme-vscode";
        publisher = "jolaleye";
        version = "2.0.2";
        sha256 = "1ch8m9h6zxn8xj92ml5294637ygabnyird3f6vbh1djzwwz5rykc"; }

      { name = "language-haskell";
        publisher = "justusadam";
        version = "2.6.0";
        sha256 = "1891pg4x5qkh151pylvn93c4plqw6vgasa4g40jbma5xzq8pygr4"; }

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
        version = "2.1.3";
        sha256 = "019nq40al1grz0q6w9vsjry92rc7aq73mbhial4wv3bdmglnjg8s"; }

      { name = "theme-monokai-pro-vscode";
        publisher = "monokai";
        version = "1.1.13";
        sha256 = "1dx47sg2nqmzqhf0ddjn837mz08qs70w79vdyb28anrjmi7k4az4"; }

      { name = "vscode-docker";
        publisher = "ms-azuretools";
        version = "0.7.0";
        sha256 = "0bgs6dy429m5yn10dd8m321slf5mqgsbr86ip61kvjwh67q9glcr"; }

      { name = "pyright";
        publisher = "ms-pyright";
        version = "1.0.44";
        sha256 = "0q25hv293d2v20296m84rj42gwv27ks9a07mlyn3qjpnfa33fz21"; }

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
        version = "1.0.509";
        sha256 = "1dxl3fc5q10gnr71w6zb00ldrayms1grh5432bypx57zlm4b7861"; }

      { name = "debugger-for-chrome";
        publisher = "msjsdiag";
        version = "4.11.6";
        sha256 = "1bpybzf2ib1rknij639kmvfl2b5q6ghnz8dmw3pm5xi59q0gcsqd"; }

      { name = "quicktype";
        publisher = "quicktype";
        version = "12.0.46";
        sha256 = "0mzn1favvrzqcigr74gmy167qak5saskhwcvhf7f00z7x0378dim"; }

      { name = "ruby";
        publisher = "rebornix";
        version = "0.24.1";
        sha256 = "0d1b3z8jpyw1bahi5c5znf2z4103s193r1hm4rn4l427pbsqbbcm"; }

      { name = "java";
        publisher = "redhat";
        version = "0.46.0";
        sha256 = "0ryc3j4n4yjbhqkqmiya97nqs82vb6160r7rc135a2hhxv8ymwgr"; }

      { name = "rust";
        publisher = "rust-lang";
        version = "0.6.1";
        sha256 = "0f66z6b374nvnrn7802dg0xz9f8wq6sjw3sb9ca533gn5jd7n297"; }

      { name = "scala";
        publisher = "scala-lang";
        version = "0.3.4";
        sha256 = "1p2ldayaxyz9q7azlwi9b25a37d6w03q4yrzdpmixklxj5d67pch"; }

      { name = "metals";
        publisher = "scalameta";
        version = "1.5.1";
        sha256 = "0fhynr97haldvk31cf777pcxbvbcqfxzd9jspwczd1xnhh9z0ic6"; }

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
        version = "0.20.0";
        sha256 = "19h2vwj7n23fi7h6fl2igknqfy9qdwd2zm6jbhizl5k1qahqb633"; }

      { name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.7.1";
        sha256 = "0mrsxgaca0nlgs3j2hvpzx99qiak1dk9sz95bm6ihs0m8ba6zyd4"; }

      { name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.18.1";
        sha256 = "0jbdcw51lnc78ncmcicgaf1avadzgyx3ad2isabw017ck0ynzcyy"; }

      { name = "vscode-maven";
        publisher = "vscjava";
        version = "0.18.0";
        sha256 = "0md5yd30ykjqnrjrsn7za7qb7n3kd2cgg7dwmzjchnrzad4q2xw0"; }
    ];
  };
}
