self: super:

let
  inherit (super) fetchurl;
in {
  vscode = super.vscode-with-extensions.override {
    vscodeExtensions = with super.vscode-extensions; [
      bbenoist.Nix
      ms-vscode.cpptools
      ms-python.python
      WakaTime.vscode-wakatime
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "auto-rename-tag";
        publisher = "formulahendry";
        version = "0.0.15";
        sha256 = "f1550037d78bd74844cb2876c21fb287323c53d5b56e638285377fef903fedc1";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "azure-account";
        publisher = "ms-vscode";
        version = "0.4.0";
        sha256 = "877662c2701a445e97a59fbea0d56d51bb7f94fcf54e547952925c3d95719ec0";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "better-comments";
        publisher = "aaron-bond";
        version = "1.2.6";
        sha256 = "268223666f2314bf32ad9a0236c93db3342fd870bc68396517052c53679bf48b";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "cmake";
        publisher = "twxs";
        version = "0.0.17";
        sha256 = "0858af6b500efe81e9b336e977b94bb43cdbbf5622e79c903903cffe40931f86";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "code-settings-sync";
        publisher = "Shan";
        version = "2.9.2";
        sha256 = "48acfc7814d75d6e7f5010728f1f13055ad7afc5aaf9d579dc5cd2439d3c2753";
      }
    # ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
    #   {
    #     name = "csharp";
    #     publisher = "ms-vscode";
    #     version = "1.15.2";
    #     sha256 = "8e596639c1b7bfe7714164a5ab1e6e8025497851917d6db5586eb79a77e73e1e";
    #   }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "debugger-for-chrome";
        publisher = "msjsdiag";
        version = "4.5.0";
        sha256 = "beedb3183ce91e4b828f6019b546aa8855deb0ebe200f1d8d341ee05012e30e3";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "githistory";
        publisher = "donjayamanne";
        version = "0.4.1";
        sha256 = "9fc8d0b6bae67a880efbe77fbbbd05c71400de857650afa20c014ec2d3eeb263";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "gitlens";
        publisher = "eamodio";
        version = "8.3.3";
        sha256 = "2ac60be573e2cddb764be76ab12c86ccfb7fa378dc066ee1001c6d70e0e3bc56";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "Ionide-FAKE";
        publisher = "Ionide";
        version = "1.2.3";
        sha256 = "49e896f331d6c1a39cf8e9512368f174864585ee9e4af6f59031acda58b74f46";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "Ionide-fsharp";
        publisher = "Ionide";
        version = "3.23.0";
        sha256 = "f5477602b83ceca5affacaa6bd6b74f351faaad6a9c14c88fe88dbed91527e15";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "Ionide-Paket";
        publisher = "Ionide";
        version = "1.11.1";
        sha256 = "3be4a94beb5aad4de8fe628b1e1233afb62d4d14d32557035daa2bb16e645fc5";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "java";
        publisher = "redhat";
        version = "0.26.0";
        sha256 = "79e601d0e470d7700eaa81c754475718c995a9755256d14738f176eb910a46c3";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "jupyter";
        publisher = "donjayamanne";
        version = "1.1.4";
        sha256 = "9e11714580dde1a65e7ab1479d67b7d976c5c8a541ef7ee4403d356d2e828d0a";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "language-haskell";
        publisher = "justusadam";
        version = "2.5.0";
        sha256 = "639987da2d55d524bc7e7e307e19593c2fd687ca4bc28f6852cdf4c231925882";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "5.5.0";
        sha256 = "fed2250d547f04445eaacacd67bc3deac68a1bf5eed6f763062dd9095c546ecd";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "path-intellisense";
        publisher = "christian-kohler";
        version = "1.4.2";
        sha256 = "248f3d5e785f2e9c032bd5c700c4a782738d1b47fec9c187686152cb4c424b44";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "prettier-vscode";
        publisher = "esbenp";
        version = "1.3.1";
        sha256 = "340c7af652710fef9bfc9e13a69fd969a5f21b1e70ae56e224623a8c5a7f34da";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "quicktype";
        publisher = "quicktype";
        version = "10.0.24";
        sha256 = "0cd4dcafe6df8ac2f059913b6f400c01c88092e838a3571cbbe8a8786ba318c7";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "Ruby";
        publisher = "rebornix";
        version = "0.18.0";
        sha256 = "567959e717b7fd9d8ec0eef39a0214eeb3c47b7ce16cc1d2cc586cde05e18dc0";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "rust";
        publisher = "rust-lang";
        version = "0.4.4";
        sha256 = "6da4fc501fb18d26a626ed315a076fae890bc98d73336727de121686341742b7";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "shader";
        publisher = "slevesque";
        version = "1.1.3";
        sha256 = "3e463af6664ef25c5969e031ceccf43bcef352ba20af4559f61f892e70142498";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "solargraph";
        publisher = "castwide";
        version = "0.17.4";
        sha256 = "3f28c7d8280a59a1670a41ba0687ad94d0442e3ebefb5c8632e5a8c1eefeca61";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "stylelint";
        publisher = "shinnn";
        version = "0.36.3";
        sha256 = "19ac7904f22e4f615f0a1d054463d05c9d5d0d1e532f2464a4ef1c31f36dfd4c";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "tslint";
        publisher = "eg2";
        version = "1.0.30";
        sha256 = "0be8e8c0952787672bbc194b70e72dd0dcdc0033ba90a5a6b769a778af937a8f";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vs-keybindings";
        publisher = "ms-vscode";
        version = "0.2.0";
        sha256 = "4831b78db2a59ad9e61b2a54c5aa33ad4468b68f60351a942e9a0ea718dedd9c";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vsc-material-theme";
        publisher = "Equinusocio";
        version = "2.3.0";
        sha256 = "21223c4ccc4ce5353a5b719c9983b06166ffd1f0d6b8e3e0193123f1383cb33d";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vscode-docker";
        publisher = "PeterJausovec";
        version = "0.0.27";
        sha256 = "f1bfd484dcde832b78d059d5b84e2e805d850af85af106b8e9a5cc4f6ed1d585";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vscode-eslint";
        publisher = "dbaeumer";
        version = "1.4.10";
        sha256 = "86a5149f84c326ba6538223722e3f0e6d13b861e4171dfa599963af5b3b6b48a";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vscode-filesize";
        publisher = "mkxml";
        version = "2.1.0";
        sha256 = "37fa0276205a22dcaaa2ff5e52db6e147f8c7c41eaaadced64a43c7f7b0dd63f";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.9.0";
        sha256 = "61e1cf349151e5240e7a3e6ea7dd2bb28857b01fae49bdfdcce8becb55a86b02";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.3.0";
        sha256 = "f88aa98eca7bbf4db95ff8af31959a1c7194345f6ffd483e55b531c90feaed73";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.6.1";
        sha256 = "9f184e05af8cc6cf90851d8c1d882be5bbf96816cf3ac7e0605afcee7372389e";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vscode-language-babel";
        publisher = "mgmcdermott";
        version = "0.0.14";
        sha256 = "25dc5742743b537a1478aa8629f931667ff5038f30804837623f57a1119f3c4d";
      }
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.8.0";
        sha256 = "6e5249e1b7080366fc29cc308be0aca0c16b0c43c92e0cb993ba73efaa204c3a";
      }
    # ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
    #   {
    #     name = "vsliveshare";
    #     publisher = "ms-vsliveshare";
    #     version = "0.3.379";
    #     sha256 = "d5f2e9f60d62b9b545ddc55fd08ecc7f79eaef00c84d6e44ee2bd3a0e6f9d198";
    #   }
    ];
  };
}
