final: prev:

with final.pkgs; {
  vscode-insiders-with-extensions = prev.vscode-insiders-with-extensions.override {
    vscodeExtensions = with vscode-extensions; [
      ms-python.python
      ms-vscode.cpptools
      WakaTime.vscode-wakatime
    ] ++ vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vsc-material-theme";
        publisher = "Equinusocio";
        version = "33.0.0";
        sha256 = "1r8g9jm34xp7lld9mwv3sja1913aan0khxqrp7az89szwpnv73vg";
      }

      {
        name = "todo-tree";
        publisher = "Gruntfuggly";
        version = "0.0.186";
        sha256 = "0frnfimvv2862bb85jgyvbky90xpxx584mir9k2fsgii1rxmv6dr";
      }

      {
        name = "r";
        publisher = "Ikuyadeu";
        version = "1.5.2";
        sha256 = "1r865v56cv0v624jl5kclmjylqsggx0lvr8pssg5gywh4d08p0wi";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "8.13.2";
        sha256 = "1hpsb4f9b8b04j8hfqbr5fsxj2rrbk7x51nl16j1f8vkdcpkd5zx";
      }

      {
        name = "r-lsp";
        publisher = "REditorSupport";
        version = "0.1.11";
        sha256 = "0xkccl82zm9qsysi0rv4k0jcn8y20iqjdlivkm5a1a0w4xjjhqf0";
      }

      {
        name = "explorer-exclude-vscode-extension";
        publisher = "RedVanWorkshop";
        version = "1.2.0";
        sha256 = "02cfkyk0b7giasc9l08a1cj51spvcqc9qmndc48k1yanm4xhzxf9";
      }

      {
        name = "better-comments";
        publisher = "aaron-bond";
        version = "2.1.0";
        sha256 = "0kmmk6bpsdrvbb7dqf0d3annpg41n9g6ljzc1dh0akjzpbchdcwp";
      }

      {
        name = "Bookmarks";
        publisher = "alefragnani";
        version = "11.4.0";
        sha256 = "1fx0j9wkdy3911jhh9x808pg7ns3ba85k3n236i0cpjxh8x1asz4";
      }

      {
        name = "vscode-sqlite";
        publisher = "alexcvzz";
        version = "0.9.0";
        sha256 = "1b27y0l59nmsvaxvf3cw32cpiq1h7g61ysml87zh1nhnv9dngxcb";
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
        version = "2.3.0";
        sha256 = "1wyp3k4gci1i64nrry12il6yflhki18gq2498z3nlsx4yi36jb3l";
      }

      {
        name = "vscode-eslint";
        publisher = "dbaeumer";
        version = "2.1.13";
        sha256 = "1adzgisljlq6xmmwrziawkgy941bf8i8nq4c9w3gnsbr20gd9pyi";
      }

      {
        name = "githistory";
        publisher = "donjayamanne";
        version = "0.6.12";
        sha256 = "1lmhym6wgfzbx2pbhmnv7s20zvjfpkfwnps0d48skzbhwvmkjnj4";
      }

      {
        name = "gitlens";
        publisher = "eamodio";
        version = "10.2.2";
        sha256 = "00fp6pz9jqcr6j6zwr2wpvqazh1ssa48jnk1282gnj5k560vh8mb";
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
        version = "1.2.0";
        sha256 = "0wh295ncm8cbxmw9i3pvg703sn1gw7vp3slbklwjxskb4zivvfk4";
      }

      {
        name = "auto-rename-tag";
        publisher = "formulahendry";
        version = "0.1.5";
        sha256 = "1ic3nxpcan8wwwzwm099plkn7fdy0zz2575rh4znc4sqgcqywh2i";
      }

      {
        name = "haskell";
        publisher = "haskell";
        version = "1.2.0";
        sha256 = "0vxsn4s27n1aqp5pp4cipv804c9cwd7d9677chxl0v18j8bf7zly";
      }

      {
        name = "language-haskell";
        publisher = "justusadam";
        version = "3.3.0";
        sha256 = "1285bs89d7hqn8h8jyxww7712070zw2ccrgy6aswd39arscniffs";
      }

      {
        name = "noctis";
        publisher = "liviuschera";
        version = "10.39.1";
        sha256 = "0950h2yx2iv177g0b5dfk6ql66r7axh9apydqx7iglcaziql6k82";
      }

      {
        name = "rust-analyzer";
        publisher = "matklad";
        version = "0.2.360";
        sha256 = "0hl4mav9slfhvyv0jkcw197lbq5bm29s7l4xrck44ygvb874w3qb";
      }

      {
        name = "vscode-language-babel";
        publisher = "mgmcdermott";
        version = "0.0.30";
        sha256 = "01aqk4xlmyvwgal8ya1dv4p88knwi7k6dwrnlq1rb4akr4fn1mfv";
      }

      {
        name = "git-graph";
        publisher = "mhutchie";
        version = "1.27.0";
        sha256 = "06w330k1lb6r03kvfsvcihxp7rh8v84czpcgx6fym1vwr7ab72wp";
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
        version = "1.7.0";
        sha256 = "0xl5y36kwh59mnb9j1pnsl5bn62z4n4lvsp31r1xscxrs9vh1ngb";
      }

      {
        name = "pyright";
        publisher = "ms-pyright";
        version = "1.1.82";
        sha256 = "1hda3cw868zlfjh1r6x7m99jgq40k1amac51i8kxwna7gmk0i8ag";
      }

      {
        name = "azure-account";
        publisher = "ms-vscode";
        version = "0.9.3";
        sha256 = "1c77xhsll4w3m3sh63hhmwnmnmalvg0axqifzdl3h2lv0fm75cx6";
      }

      {
        name = "hexeditor";
        publisher = "ms-vscode";
        version = "1.3.0";
        sha256 = "15zp4abnsd6z7vv81d6d2p9lfimj0qalv9zh9c5pki101yb7581s";
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
        version = "1.0.3071";
        sha256 = "1zcm1za0dd8pjypwragywhbpwxc2q1abay9fm6brvhp79zclff7j";
      }

      {
        name = "debugger-for-chrome";
        publisher = "msjsdiag";
        version = "4.12.11";
        sha256 = "03krf4rfdyvb2i1qpzqygbcmqgjf00pcsc67wm2p31jk460d6bgn";
      }

      {
        name = "gremlins";
        publisher = "nhoizey";
        version = "0.25.0";
        sha256 = "05a1lwjiyhv7dk4im2g8yaigdn1xgx9s93ypa0i1gpmsb4l4xicd";
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
        version = "0.69.0";
        sha256 = "1x5rphs085a38jzlyki49smk3wg58y3592x2jr5akpadh05vh6hp";
      }

      {
        name = "jinjahtml";
        publisher = "samuelcolvin";
        version = "0.15.0";
        sha256 = "18mjabpzldsaz5r1sp94kwk28chrmifcr4aql0fag6yh2kms1jas";
      }

      {
        name = "scala";
        publisher = "scala-lang";
        version = "0.4.5";
        sha256 = "0nrj32a7a86vwc9gfh748xs3mmfwbc304dp7nks61f0lx8b4wzxw";
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
        version = "0.85.0";
        sha256 = "14nb3rr128kl7n1c70bbmi1v127dlj64qi37qz300fkdzgpl88mn";
      }

      {
        name = "cmake";
        publisher = "twxs";
        version = "0.0.17";
        sha256 = "11hzjd0gxkq37689rrr2aszxng5l9fwpgs9nnglq3zhfa1msyn08";
      }

      {
        name = "errorlens";
        publisher = "usernamehw";
        version = "3.2.3";
        sha256 = "03vv2zmkch5jzdw6pbv86s7qj7f7ljk0wyf52cc6nsilbwdvfi33";
      }

      {
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.29.0";
        sha256 = "117z57fyl2ak6c71hrdh3xp9zsw2l4m90qw050n83an04lkxpqy4";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.10.0";
        sha256 = "1aqyyd6j92xzaaif68csigvs3qflx56ifmv869f1x84jasryvi50";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.25.0";
        sha256 = "1n62x1r0rzhaifaxrgj7khddmmmsmmi1s741b3fnnrb08p2gc7n2";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.25.0";
        sha256 = "09akmp94salxyrz1d48sji75ajl9mvchi70xab7ypdqp7xdd46j4";
      }
    ];
  };
}
