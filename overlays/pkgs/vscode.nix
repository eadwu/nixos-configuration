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
        version = "30.0.0";
        sha256 = "0gkd24jiwgb7mmfrw8iwwl1abz675cpxjn6bfahlql07pyp8y4xc";
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
        version = "4.0.6";
        sha256 = "1wrr45sklsb1741hj1q9fy3qxchxw7xpiwhq3s7vhcjywmfkjl7g";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "8.1.1";
        sha256 = "11xvspcbmq4b7g1q3bxq7hb4qdn1j3phm70jrfzb9w9bz0diwmik";
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
        version = "0.0.28";
        sha256 = "1gfwnr5lgwdgm6hs12fs1fc962j9hirrz2am5rmhnfrwjgainkyr";
      }

      {
        name = "vscode-sqlite";
        publisher = "alexcvzz";
        version = "0.8.0";
        sha256 = "0s1lzp4vzwpi7d85c7bnf5y3cx4snnn9bdnf1fb7j0p2hdhrzll6";
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
        version = "1.9.1";
        sha256 = "0q3vnqmik1228zsy7favzsr3xpaci3z1zh38m79cpy5rac5bcr62";
      }

      {
        name = "githistory";
        publisher = "donjayamanne";
        version = "0.4.6";
        sha256 = "1wj838iv1xg25a604j4mccdcqhjjcgpaaq6yhnng1ph0s16ypin1";
      }

      {
        name = "gitlens";
        publisher = "eamodio";
        version = "9.9.3";
        sha256 = "04rns3bwc9cav5rdk5bjm6m0lzjqpm9x99539bhk319l83ksffyv";
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
        version = "1.0.6";
        sha256 = "1xccg318bybfxz8gc56sfk9aqnfpigc64kczgbffaklp2fzcws9q";
      }

      {
        name = "auto-rename-tag";
        publisher = "formulahendry";
        version = "0.1.0";
        sha256 = "1zcxcf269jbwpsa29mlmfs3z8awbsccrq595m6chqrspnw2l8a2b";
      }

      {
        name = "language-haskell";
        publisher = "justusadam";
        version = "2.6.0";
        sha256 = "1891pg4x5qkh151pylvn93c4plqw6vgasa4g40jbma5xzq8pygr4";
      }

      {
        name = "noctis";
        publisher = "liviuschera";
        version = "10.9.0";
        sha256 = "1rj5ik7nh391ivhgf1ywx48bz7hc6qpkawks0hyyhdavkcbbj87q";
      }

      {
        name = "vscode-language-babel";
        publisher = "mgmcdermott";
        version = "0.0.24";
        sha256 = "0mxlvd5abballyg7ya1my2y1wgcmiw2wzhsj2l0gnfkn3zyl91bc";
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
        version = "0.8.1";
        sha256 = "0n59whmcrx8946xix6skvc50f2vsc85ckvn8cs06w9mqmymm1q0s";
      }

      {
        name = "pyright";
        publisher = "ms-pyright";
        version = "1.0.62";
        sha256 = "1xcca2qq6555918dlx3a0rdsnls0mphglk4fxjw2vgc5c9gkg6cy";
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
        version = "1.0.809";
        sha256 = "1dsjv91z1ircgxf2by9f5f6ph5wlkg7qpb20j4l8wm5xp52xc0l2";
      }

      {
        name = "debugger-for-chrome";
        publisher = "msjsdiag";
        version = "4.11.7";
        sha256 = "11nsl98aqmw4a1s1v33ljk66kr8gi41pvvbc51v4fvbwk0r1xdx0";
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
        version = "0.25.3";
        sha256 = "0b37as82f1dald6yly3rxzrwiq5897a1q5ihpf18whvfm65nbh7a";
      }

      {
        name = "java";
        publisher = "redhat";
        version = "0.48.0";
        sha256 = "0akvy4ryf2zvfy4pgxdh94f9dprv1hx75c87i9cgv0flm89rwmp3";
      }

      {
        name = "rust";
        publisher = "rust-lang";
        version = "0.6.3";
        sha256 = "1r5q1iclr64wmgglsr3na3sv0fha5di8xyccv7xwcv5jf8w5rz5y";
      }

      {
        name = "jinjahtml";
        publisher = "samuelcolvin";
        version = "0.10.5";
        sha256 = "1mv2zkp09dgqdvvr42mwajm0cninqqw2g2adi5b5ki63niv5xx2y";
      }

      {
        name = "scala";
        publisher = "scala-lang";
        version = "0.3.5";
        sha256 = "1al6ab8rx6lkw1qba435qhs2dxzydlvqd8jjf349ld2578ib11dp";
      }

      {
        name = "metals";
        publisher = "scalameta";
        version = "1.5.4";
        sha256 = "0jpd2ha5i52lnki2m8nymc78fw2bbqkac9l6vy8x07xrq1lixj8j";
      }

      {
        name = "stylelint";
        publisher = "shinnn";
        version = "0.51.0";
        sha256 = "0qxa6jcfjl9vkx06shxjpa8k99ysvar3i0pzqdnc4aizjcayn3i4";
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
        version = "0.21.0";
        sha256 = "0gxrz8w97ksrqyim62hx02rfq91dvw4msn5a4mqd5kw27gqfc26x";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.8.0";
        sha256 = "1iq8wq8dzm99cp8y8d6p03ad0qki2ndg5vlwsmns46kz93q8g43b";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.19.0";
        sha256 = "0nb2pkdijyk9k1981mnrxng2sn7sq2v2waw75cp68j3mjg597l22";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.18.2";
        sha256 = "15gnxli7flvvbfbkqslmw63ykfjgbccmfml32rfjv7418fdljdz1";
      }
    ];
  };
}
