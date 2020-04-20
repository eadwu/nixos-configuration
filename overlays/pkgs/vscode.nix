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
        version = "32.5.0";
        sha256 = "0vgzny41zlwin4gbjvbbhpv5gpjr4j6sjkym8dqk1pw20svnnhvb";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "8.8.0";
        sha256 = "1nj12w0bxmqd18k2rqpxq7aibjhyzlw844zspghg5qmlwa44rzdm";
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
        version = "2.1.3";
        sha256 = "0mv4hwj18fqmm0ri59a9wd556qla12zw2ivbbqszbzaifa1fi0ak";
      }

      {
        name = "githistory";
        publisher = "donjayamanne";
        version = "0.6.3";
        sha256 = "0h989yl1mmi5kfmskcdi1xcjmgv9kpzkx5znjaby8wzdwjlprm1p";
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
        version = "10.29.1";
        sha256 = "0i65b3irajj3ssvd834f6c684jz4sj0b3cx3ilp0krlc1642cqn7";
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
        version = "1.0.0";
        sha256 = "1zljdgym3kz4plb2a3z0yxvpqf4lnf215rajjs5sr7dxx3dwrxdg";
      }

      {
        name = "pyright";
        publisher = "ms-pyright";
        version = "1.1.32";
        sha256 = "1c24k35gga73ba6vay6z834h0mnxis7nx2a6nzicy4gnyfs9kans";
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
        version = "1.0.2000";
        sha256 = "1g5k94hizfdfcb1ipqr1wj07x41ynavy3ivbpr8c5vml9dkfzn48";
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
        version = "0.60.0";
        sha256 = "0ayaqh9q40yc8nnahr9r50cxwr3vk7gjbpx0lc4sysmsa3dhl8py";
      }

      {
        name = "rust";
        publisher = "rust-lang";
        version = "0.7.2";
        sha256 = "1aafh5f0qx96c575jk7xfb3jr97nrczn8n7i1h2p500rgxsg8vr4";
      }

      {
        name = "jinjahtml";
        publisher = "samuelcolvin";
        version = "0.12.0";
        sha256 = "0h6nyjhmnva2zfi96s73mvgrr3bbjw6c802cqbwrr8kka4bg9s61";
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
        version = "0.21.2";
        sha256 = "1ivmxf41ywxaihmqrg4l6qxrj5x9xag126s4lfzmgnb9cl86f489";
      }
    ];
  };
}
