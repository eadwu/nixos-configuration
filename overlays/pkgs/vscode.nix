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
        version = "0.0.183";
        sha256 = "02m70yxabbgi24ly792wfw1aah69vr59j2czypwhsq72rrplclfh";
      }

      {
        name = "r";
        publisher = "Ikuyadeu";
        version = "1.4.6";
        sha256 = "1s69hnbrdclp8n0gpac3sg96ficvxjfzxqj97yi2y32l5yjk3q2s";
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
        version = "11.3.1";
        sha256 = "0g4a18r6qqclp5q02nxf5pjyrv6y9l9xrmqblgbjlmh25bzvwgz0";
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
        version = "2.1.10";
        sha256 = "0z8li3146n51510njnix0k4z5xxwkg8251k7jr029avx25kdgam5";
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
        version = "10.39.0";
        sha256 = "1ys05zym4pgdi0g7d3xwa80prxqriznbyjqb46qqswjrqdzk1lrk";
      }

      {
        name = "rust-analyzer";
        publisher = "matklad";
        version = "0.2.336";
        sha256 = "1m7mdkhivnazvs63zl69cwlm4h8y3xc26s6xa2sl5hrn7skc3lqy";
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
        version = "1.26.0";
        sha256 = "0zvxsbx26frsawmm4ad15wbi312df4vs890pj45h0y4mrhbdmc8s";
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
        version = "1.6.0";
        sha256 = "1snjj09qn0c6ipd3i3xyzah4gnh17j5h9vn01db294xpbl2q80n0";
      }

      {
        name = "pyright";
        publisher = "ms-pyright";
        version = "1.1.78";
        sha256 = "1xyg3pkc2pf24z7h4bw6zffinq68p1ybqgp6qjz0dp1xsn20dpzm";
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
        version = "1.0.2902";
        sha256 = "0fx2vi0wxamcwqcgcx7wpg8hi7f1c2pibrmd2qy2whilpsv3gzmb";
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
        version = "0.24.0";
        sha256 = "04ccf11a2bxlg8mmn69s0rvh5aq1nc0a5kx6z08dbabqqbvy3rjn";
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
        version = "0.68.0";
        sha256 = "0lpk36wqy6l1sq1pkfawlmq3y6032zqf77dvcap9jvxgr3haqh2v";
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
        version = "0.28.0";
        sha256 = "0g7d8ygnr466jc37pjx2a926y94kwvplrkkgxqkzwdfy6224khp2";
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
        version = "0.24.2";
        sha256 = "13qf0hzjcpi06g1fw424jasrqsf9nr28vjfni61hkbw7dzxwchiv";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.24.2";
        sha256 = "09qckzygpvbfl45ccdrxn1imhis7bmr7skb4zarr2hy8jinl6ql5";
      }
    ];
  };
}
