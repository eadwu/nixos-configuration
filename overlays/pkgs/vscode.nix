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
        version = "0.6.2";
        sha256 = "01qx6yiy64vfmg5305mrw6w18baa7a55h8wrq47h1wrmfyca52js";
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
        version = "10.28.0";
        sha256 = "1f583k4w1172n5nfq950jzmlrg2fi5df8cyzfb9q83k4sakrvnvi";
      }

      {
        name = "vscode-language-babel";
        publisher = "mgmcdermott";
        version = "0.0.26";
        sha256 = "1n0i0kylx7gvk5r95kjlvnyhbn58kz10p7s2jgh09bxnv32r7mx2";
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
        version = "1.1.26";
        sha256 = "0lxnycrxpdnmg9kz83pxlbjx4w26m7p1iypj5bzdd1jmp8yrlpqn";
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
        version = "1.0.1711";
        sha256 = "04pjbi24d1yzf2xgx92i0rm6mkgzn7amddln0am8a42agkalyxf1";
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
        version = "0.58.0";
        sha256 = "1knxz10lx3cmfkb4sivwqx5hi9kd2vi9rab4lyp3z08pzcxzagha";
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
        name = "metals";
        publisher = "scalameta";
        version = "1.8.0";
        sha256 = "0r1r96xclr8c3rjgs944zdim9rjq6hfajvv7yh3hn75cy684bck5";
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
        version = "0.25.1";
        sha256 = "1cma1m9ig1r64ss60dkiyjdpk65achvfzq2sld5dmhvp5jdqmif8";
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
        version = "0.22.2";
        sha256 = "0cwr53drbr9bix9qfwm42c61icj81jn3q9fldin96418h32bf9fb";
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
