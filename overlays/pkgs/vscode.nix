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
        version = "0.0.178";
        sha256 = "0va6xry4kk6vc22rbr87wka6d9kmwzqi9850g6ppz71k30l2l1jz";
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
        version = "2.1.8";
        sha256 = "18yw1c2yylwbvg5cfqfw8h1r2nk9vlixh0im2px8lr7lw0airl28";
      }

      {
        name = "githistory";
        publisher = "donjayamanne";
        version = "0.6.10";
        sha256 = "14ph05wz9cdxwmyprh6wjcbwrbsyjlirdjlq2lcr8hqmscjac73v";
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
        version = "0.1.4";
        sha256 = "0lww2xx5h16kxx3awax1gg4v46zbx9gwkjlnrgwncmvqfn3jb6w9";
      }

      {
        name = "haskell";
        publisher = "haskell";
        version = "1.1.0";
        sha256 = "1wg06lyk0qn9jd6gi007sg7v0z9z8gwq7x2449d4ihs9n3w5l0gb";
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
        version = "10.38.0";
        sha256 = "1v25zwjbxh0xs1j9r39f8g84861lass6kdwnxl2bfaq9hclx65v8";
      }

      {
        name = "rust-analyzer";
        publisher = "matklad";
        version = "0.2.320";
        sha256 = "1pdldxd3w44kb4rk74r47k0pfsp9nc7rlm7s0wz33d26dyq0mn7s";
      }

      {
        name = "vscode-language-babel";
        publisher = "mgmcdermott";
        version = "0.0.29";
        sha256 = "1kwxhn5i227kb782l1i68jy169qq2ygfdnnjmcp4dgk4zzwyzzjv";
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
        version = "1.1.74";
        sha256 = "12ghdvkkn62hg5jwb084wjdgl93na8709f9wck1pna9xizk89zkc";
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
        version = "1.0.2740";
        sha256 = "11pfd4mxg8a2wrlnsbpk7apz69his7sgnzq6hp14wsw8p88wi61y";
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
        version = "0.23.1";
        sha256 = "0fbb7j8cnnl187v2336qx0wxjbbc1v3qvyklxspn3brqbrrk0rfn";
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
        version = "0.67.0";
        sha256 = "1mk3z0225y37nwii7lnqwwrv2sqiz9p9in850mizsbd7dp4gapy6";
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
        version = "0.4.3";
        sha256 = "1h736b09q89xjgzpgfwmzj58hl56r6sd6k78sf49d4rmi6qi47v1";
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
        version = "3.2.1";
        sha256 = "0fdy8kclna51vwyfsgv6m9i6ksd1kb73pifpqvywg6c28fg83ln5";
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
