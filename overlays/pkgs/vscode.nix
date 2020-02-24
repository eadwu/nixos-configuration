self: super:

{
  vscode = (
    super.vscode.override {
      isInsiders = true;
    }
  ).overrideAttrs (
    _: rec {
      name = "${pname}-${version}";
      pname = "vscode-insiders";
      version = "nightly";

      src = builtins.fetchurl {
        name = "VSCode_latest_linux-x64.tar.gz";
        url = "https://vscode-update.azurewebsites.net/latest/linux-x64/insider";
      };
    }
  );

  vscode-with-extensions = super.vscode-with-extensions.override {
    vscodeExtensions = with super.vscode-extensions; [
      ms-python.python
      ms-vscode.cpptools
      WakaTime.vscode-wakatime
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vsc-material-theme";
        publisher = "Equinusocio";
        version = "32.5.0";
        sha256 = "0vgzny41zlwin4gbjvbbhpv5gpjr4j6sjkym8dqk1pw20svnnhvb";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "8.7.2";
        sha256 = "17rv3yqns8jh1y7j36nyrs1kxg30hwrhyhviccwjrwy08ls9qvqk";
      }

      {
        name = "better-comments";
        publisher = "aaron-bond";
        version = "2.0.5";
        sha256 = "0wrkiwd98n5zm59g37mz4za8d17dabdf3yqm5jk0js90irj706pv";
      }

      {
        name = "vscode-hie-server";
        publisher = "alanz";
        version = "0.0.37";
        sha256 = "005whyqxisw959vgm1d6m3ll0q1ydgq5jm8ziv721n4m63dk77dj";
      }

      {
        name = "vscode-sqlite";
        publisher = "alexcvzz";
        version = "0.8.1";
        sha256 = "0d2n1wi46cr3zy7i23kn2bbn9v1lvr7md2zp8xf5ixwklyf1ciyj";
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
        version = "0.21.1";
        sha256 = "15dy6pg4cm0marj5wf5swqk60vmm0xbz284r26jhyn2jai8ccb33";
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
        version = "2.1.1";
        sha256 = "11ybn0hrarp1v06zjql9lcbvr70ryhij8v2v23q45gm0qgmpk5ib";
      }

      {
        name = "githistory";
        publisher = "donjayamanne";
        version = "0.5.3";
        sha256 = "1ix75a9gpyhq8135xcgin1vjwdi7rsnp96x4v86p9hs1zpv7mm6q";
      }

      {
        name = "gitlens";
        publisher = "eamodio";
        version = "10.2.1";
        sha256 = "1bh6ws20yi757b4im5aa6zcjmsgdqxvr1rg86kfa638cd5ad1f97";
      }

      {
        name = "tslint";
        publisher = "eg2";
        version = "1.0.44";
        sha256 = "11q8kmm7k3pllwgflsjn20d1w58x3r0vl3i2b32bnbk2gzwcjmib";
      }

      {
        name = "vsc-material-theme-icons";
        publisher = "equinusocio";
        version = "1.1.4";
        sha256 = "02m9vy39ip95cp8zzb20yyfh2kqfs0b5v6hnc2iyda2anqlzafbr";
      }

      {
        name = "auto-rename-tag";
        publisher = "formulahendry";
        version = "0.1.1";
        sha256 = "0r2bavgbkkly2l98sbrna0i2l0lh2axgqij1acv33kk1wr3lfxfx";
      }

      {
        name = "language-haskell";
        publisher = "justusadam";
        version = "2.7.0";
        sha256 = "1z6nxbg1a0yvbdicib3kxl04hrxwxi3p1hmc0qfahqkf6xwcmlc5";
      }

      {
        name = "noctis";
        publisher = "liviuschera";
        version = "10.26.0";
        sha256 = "1raq5ipdgkcdprb7250z0icb62kpvgjx09chqmacb5301fzds2i8";
      }

      {
        name = "vscode-language-babel";
        publisher = "mgmcdermott";
        version = "0.0.25";
        sha256 = "1cgw353j3c78mbnqavksxizwh82f4gdnx27720p825hnyc1ddv1h";
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
        version = "2.1.3";
        sha256 = "019nq40al1grz0q6w9vsjry92rc7aq73mbhial4wv3bdmglnjg8s";
      }

      {
        name = "vscode-docker";
        publisher = "ms-azuretools";
        version = "0.10.0";
        sha256 = "1n4pviahpr67y6zz3nvj6841dv0vpdrg9wi9w5viv9vc3psj5mkp";
      }

      {
        name = "pyright";
        publisher = "ms-pyright";
        version = "1.1.25";
        sha256 = "02jmay1q1xpyr8k284068qvf5zmhhacz52r48f28vq8gxzvnv5zb";
      }

      {
        name = "azure-account";
        publisher = "ms-vscode";
        version = "0.8.10";
        sha256 = "02hra09501xl08xwinnry4pgl8p9y8j5ars5h20amz5h7xvs8y58";
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
        version = "1.0.1653";
        sha256 = "0hasf85a7wil3npm8gk1yw2h0snh3m8784dlm6w631k1diji8ca9";
      }

      {
        name = "debugger-for-chrome";
        publisher = "msjsdiag";
        version = "4.12.6";
        sha256 = "1dlplz72830shqbi7zkgg7pb45ijwajwhkmapx4lmlw13z41jw1g";
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
        version = "0.26.0";
        sha256 = "0l9q2z6bjd568ly3vzksmf6c50kzghp74ixwrhjsfd0wxqmryair";
      }

      {
        name = "java";
        publisher = "redhat";
        version = "0.57.0";
        sha256 = "0zy8bprhs43294kby2apbjxzwhlw0iyzcb3n7ip84ysr2grp1bj4";
      }

      {
        name = "rust";
        publisher = "rust-lang";
        version = "0.7.0";
        sha256 = "16n787agjjfa68r6xv0lyqvx25nfwqw7bqbxf8x8mbb61qhbkws0";
      }

      {
        name = "jinjahtml";
        publisher = "samuelcolvin";
        version = "0.11.0";
        sha256 = "16434pb5s6n49l8hfdlvphbshcmykpx1vrh8iiq58ggff1vaywri";
      }

      {
        name = "scala";
        publisher = "scala-lang";
        version = "0.3.9";
        sha256 = "0l6zrpp2klqdym977zygmbzf0478lbqmivcxa2xmqyi34c9vwli7";
      }

      {
        name = "metals";
        publisher = "scalameta";
        version = "1.7.8";
        sha256 = "0bl0j1inzrg9ylil5lb79q26j34gfy023xcv04ycrjsjkhlslpqc";
      }

      {
        name = "shader";
        publisher = "slevesque";
        version = "1.1.4";
        sha256 = "0m5ld6l5sizqbj2k6754n2hn50ygajy464qz66dar2n3nhvjdv9n";
      }

      {
        name = "vscode-stylelint";
        publisher = "stylelint";
        version = "0.83.0";
        sha256 = "1q5kj1dw55hr7k7y80mzi5h35r3z5k187qwz5y01rdi0sjsc64aa";
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
        version = "0.25.0";
        sha256 = "18blvimmf9lbkxbcxp251bf251gyxbpcxwi04vl9f7z4ykl7fh7k";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.8.1";
        sha256 = "1xa35bbx6xdxvz15fpjsa5j4f6aas5zxsmpd4dv6hkzlzizafrfr";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.22.1";
        sha256 = "154f62kx8aibhr9n9c6368xrmsg4vk0pd3lqiy8ffdvrlcwjx4nl";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.21.0";
        sha256 = "0c7ydyjj4m5mxgyi7yqqb8vd20d5mag230blah9bw6xw68y2fg40";
      }
    ];
  };
}
