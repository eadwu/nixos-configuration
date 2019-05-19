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
        version = "3.37.0";
        sha256 = "02cjvnxy2qsdgpj7bda9bz2mw079hwi8g4n91nn3pp3gykm4hmpj"; }

      { name = "latex-workshop";
        publisher = "James-Yu";
        version = "7.0.0";
        sha256 = "1kfkmnysdi30pamjda7i0jsn0qw1j9nrkh5fl6br35wla3jk393m"; }

      { name = "vscode-docker";
        publisher = "PeterJausovec";
        version = "0.6.2";
        sha256 = "1is5b7l6if103219d2bg4gar02p0asq87qswnkzgjqpnawrgkshd"; }

      { name = "better-comments";
        publisher = "aaron-bond";
        version = "2.0.5";
        sha256 = "0wrkiwd98n5zm59g37mz4za8d17dabdf3yqm5jk0js90irj706pv"; }

      { name = "vscode-hie-server";
        publisher = "alanz";
        version = "0.0.27";
        sha256 = "1mz0h5zd295i73hbji9ivla8hx02i4yhqcv6l4r23w3f07ql3i8h"; }

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
        version = "0.19.6";
        sha256 = "1wibaz834zlc9cg5ckfap2bgy41p7vi97va9qhcm5zdq4lgk7rlp"; }

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
        version = "9.7.4";
        sha256 = "135gn44ns62aimg44pm9pcj36vrbj3pvqdm0z3igw5rm1bf9lxz0"; }

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
        version = "1.8.1";
        sha256 = "12r6jrh6pmxy4lrdd53l1d87lwnanic5ma4x7szhrwai1lvzxjxl"; }

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
        version = "2.1.2";
        sha256 = "09x394pp4231fjw9mvrp332jw21n7dw9r68cbph526mhhdjnj81i"; }

      { name = "theme-monokai-pro-vscode";
        publisher = "monokai";
        version = "1.1.13";
        sha256 = "1dx47sg2nqmzqhf0ddjn837mz08qs70w79vdyb28anrjmi7k4az4"; }

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
        version = "1.0.182";
        sha256 = "0b3sbn4vjrdbbjfgm609aapyjiyd9r1kfz5ks5dyll9i1fxl7ndm"; }

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
        version = "0.45.0";
        sha256 = "0xhqi5cpgxdbpi834n8lw6k0rgmcabfybm56l9qrwgal6gic9792"; }

      { name = "rust";
        publisher = "rust-lang";
        version = "0.6.1";
        sha256 = "0f66z6b374nvnrn7802dg0xz9f8wq6sjw3sb9ca533gn5jd7n297"; }

      { name = "stylelint";
        publisher = "shinnn";
        version = "0.49.0";
        sha256 = "0zgsmg20zhvr41sxndaccqkhs00y4wysp6fz722pn2mvpmpcn4ca"; }

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
        version = "0.18.0";
        sha256 = "106r2w5k889q6m3glchvk4vy7vnllzsr10fzzwzbdqnv8cac12cr"; }

      { name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.7.1";
        sha256 = "0mrsxgaca0nlgs3j2hvpzx99qiak1dk9sz95bm6ihs0m8ba6zyd4"; }

      { name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.16.0";
        sha256 = "0996a5was6pjyq5n8xk0kj037r6zad19pbf47i905myv4k13xgvn"; }

      { name = "vscode-maven";
        publisher = "vscjava";
        version = "0.16.2";
        sha256 = "1rdfqpk2ml7qcnqarzpb60j3y22nay62jrxkfir431499cihxhgh"; }
    ];
  };
}
