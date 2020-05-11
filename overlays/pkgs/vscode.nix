self: super:

{
  vscode-insiders-with-extensions = super.vscode-insiders-with-extensions.override {
    vscodeExtensions = with super.vscode-extensions; [
      ms-python.python
      ms-vscode.cpptools
      WakaTime.vscode-wakatime
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vsc-material-theme";
        publisher = "Equinusocio";
        version = "32.6.0";
        sha256 = "0x45rfdha16jvz7xw88zw4gjh6p658nrcjw6ix81r9gh180prsq6";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "8.9.0";
        sha256 = "0dg7pf2kj65kfapvdpvzmgqqcwd37kiww23xcn1jib2r1gwy6ffr";
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
        version = "0.0.40";
        sha256 = "1cmlgidjma41s5zq5161gcxxmk5lfzcm8dvznls04y5l7q9b0gca";
      }

      {
        name = "vscode-sqlite";
        publisher = "alexcvzz";
        version = "0.8.2";
        sha256 = "0ga0blg4b459mkihxjz180mmccvvf8k4ysini8hx679zsx3mx3ip";
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
        version = "2.1.5";
        sha256 = "1fr8n736pfjnxz7kgi6m86d2w6z1bwxa23xpfcd8sik9nnrnsz59";
      }

      {
        name = "githistory";
        publisher = "donjayamanne";
        version = "0.6.5";
        sha256 = "0v6f8mkdwm6c0ypjhra22iv5fmmjpdc8fnja70zjkvbgxb48cd2s";
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
        version = "0.1.2";
        sha256 = "12ckxffcl0m366mb7jzss0abcxizrajq5s2cjy91j7mmqhxqz58j";
      }

      {
        name = "language-haskell";
        publisher = "justusadam";
        version = "3.0.3";
        sha256 = "1sg4g8h1gww4y67zix5f33v2gf121k2fcm6l1m7lygpkn40a8dsj";
      }

      {
        name = "noctis";
        publisher = "liviuschera";
        version = "10.29.1";
        sha256 = "0i65b3irajj3ssvd834f6c684jz4sj0b3cx3ilp0krlc1642cqn7";
      }

      {
        name = "rust-analyzer";
        publisher = "matklad";
        version = "0.2.159";
        sha256 = "1l6zhr85lhnssjv7z3m5hagrkdx0pq5vc1gbdsdwabn490nipbmb";
      }

      {
        name = "vscode-language-babel";
        publisher = "mgmcdermott";
        version = "0.0.27";
        sha256 = "0a2wywb696fxkbkarpyjkfx50xr4kn5j5z8gb2cj71w165kngw51";
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
        version = "2.1.4";
        sha256 = "0hk397iijr84f71ipv5b5n0dw9xmnhnzpzm3a06hflbavjfv5z2y";
      }

      {
        name = "vscode-docker";
        publisher = "ms-azuretools";
        version = "1.1.0";
        sha256 = "0pnhgmp7v086mg7bb0hv3fnbs58kr73218a139va7qq10yxjf4ra";
      }

      {
        name = "pyright";
        publisher = "ms-pyright";
        version = "1.1.36";
        sha256 = "05skhg6rpczqyjaf5v06151wx5kp2lbd93sqxlv6pbawbc02asxm";
      }

      {
        name = "azure-account";
        publisher = "ms-vscode";
        version = "0.8.11";
        sha256 = "05zz91wn5miikaw35yajps4901lv3wyvqyz72dqvic3mmcm5gcyy";
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
        version = "1.0.2106";
        sha256 = "14qp3xsnb0yn6xpdyj0vzkpfz20af5kdcpkd2qgkz9fq26s1cil8";
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
        version = "0.27.0";
        sha256 = "1y0fvciqxkj7nwvh4x25vrjfk1rym9h5fd38s89qfla36ac88fpr";
      }

      {
        name = "java";
        publisher = "redhat";
        version = "0.61.0";
        sha256 = "1mnqzlzscy6wnzh6h8yjhz190z6wvhkp4g8db151haz4jvxrfhnn";
      }

      {
        name = "jinjahtml";
        publisher = "samuelcolvin";
        version = "0.13.0";
        sha256 = "19vmvfqdzd452xhmykw8a8j5cxzmsz5g9sl4jllsn59qj9qp6nck";
      }

      {
        name = "scala";
        publisher = "scala-lang";
        version = "0.3.9";
        sha256 = "0l6zrpp2klqdym977zygmbzf0478lbqmivcxa2xmqyi34c9vwli7";
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
        version = "0.84.0";
        sha256 = "0n8shcx63ilhv9ncqm57nnn1fdm5bz53vhc0p6kffl3gs1axkx9x";
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
        version = "0.25.1";
        sha256 = "1cma1m9ig1r64ss60dkiyjdpk65achvfzq2sld5dmhvp5jdqmif8";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.9.0";
        sha256 = "0yvbxlflz5gx2i16kjh4mg64z8138rh0ck8n986hf66gjr7vv89m";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.22.3";
        sha256 = "0l7lpdzk05zvl81wyxjiqkmw1kbx286j2kq8jjq396alxfznv48k";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.21.3";
        sha256 = "08mhvi4nfwrgwskj1vyfb6q6ij4mxd0p2dpj5sjafbwyr1w7fw15";
      }
    ];
  };
}
