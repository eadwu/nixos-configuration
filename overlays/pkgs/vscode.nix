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
        version = "32.4.0";
        sha256 = "0m9crbzxk7myz9jkdx9slsrsqjpkwgg1k5a7d5z9w4ng68aazxyw";
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
        version = "4.5.0";
        sha256 = "08lvlkl27irdvshfhmvshz3d68pwcqsf1nwlccjhsg850282732k";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "8.6.0";
        sha256 = "1zalfb86xlfk1prh2m9550q0g07h0hm4dxhim3qhsn1ncp93wk2q";
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
        version = "0.0.34";
        sha256 = "0cipm36l3219r1yhk4j7l02mc2c0chfnv7wl44n1h0966jp1sda3";
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
        version = "2.0.15";
        sha256 = "0k3z7q69rpw8rqf74zw9b4v9rmlkdih0ddi5yff003jcfsjflhnc";
      }

      {
        name = "githistory";
        publisher = "donjayamanne";
        version = "0.4.13";
        sha256 = "0alhmd1mi441l7cfv2p7xmz2w34l6vgs0dz8nhw2pap8w67mnyr3";
      }

      {
        name = "gitlens";
        publisher = "eamodio";
        version = "10.2.0";
        sha256 = "0qnq9lr4m0j0syaciyv0zbj8rwm45pshpkagpfbf4pqkscsf80nr";
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
        version = "1.1.3";
        sha256 = "01b8ibs7rj245c8v6vp0by0fk2pi7k1njs4qy0isn9rhzn1fvfqs";
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
        version = "0.9.0";
        sha256 = "0wka4sgq5xjgqq2dc3zimrdcbl9166lavscz7zm6v4n6f9s2pfj0";
      }

      {
        name = "pyright";
        publisher = "ms-pyright";
        version = "1.1.21";
        sha256 = "0ckdhm1fl8pgia7b2iv2f4jxwlvgy9yv9187qzb96v4cnclvvljh";
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
        version = "1.0.1510";
        sha256 = "19viddx9a7y9265s4gplid7rjlxqmk3lcpcqcsxhcxa0cxqfm5ys";
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
        version = "0.55.1";
        sha256 = "1vj6brvh4y0cc9dca100xzawgmy1v127yy24wfxk8fm58a00ysv9";
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
        version = "0.3.8";
        sha256 = "17dl10m3ayf57sqgil4mr9fjdm7i8gb5clrs227b768pp2d39ll9";
      }

      {
        name = "metals";
        publisher = "scalameta";
        version = "1.7.2";
        sha256 = "0d4a1648g7ziqgz0mj2n2gd0vzhgmd3nbwfsmfxn9l50zwxgvz6p";
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
        version = "0.80.0";
        sha256 = "0xxkk964zz59s084j0yfajyk4b4xiyi170jvkn661dwzdxiz17ji";
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
        version = "0.24.0";
        sha256 = "0azm9q0adrdhzansz0aywcrnd40jinsvz9yj0n8mmr15nbqx2kbd";
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
        version = "0.20.2";
        sha256 = "02fp7imsa3xg1rvck1g57ccxb946gk7c82n58qjckq0fwspn8g4p";
      }
    ];
  };
}
