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
        version = "32.8.0";
        sha256 = "0w6mng7j5vx9lfiacaqxnbl80nia7vzz09lp1cmsvnxgd0nhpvsy";
      }

      {
        name = "r";
        publisher = "Ikuyadeu";
        version = "1.4.4";
        sha256 = "0ckbbiagcyy7b9z03k5cvlpvzmjj1i3hw7lww74n8wm8l3p0z06r";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "8.11.1";
        sha256 = "09bxymx77jnp49bbcj8ydgi5mhgwcfda1qpxarwy1017rdyihs6z";
      }

      {
        name = "r-lsp";
        publisher = "REditorSupport";
        version = "0.1.10";
        sha256 = "0iqvsix96zszim0dhqb819m08pawm4hn732b0gnl59p336gywfky";
      }

      {
        name = "better-comments";
        publisher = "aaron-bond";
        version = "2.1.0";
        sha256 = "0kmmk6bpsdrvbb7dqf0d3annpg41n9g6ljzc1dh0akjzpbchdcwp";
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
        version = "2.2.1";
        sha256 = "0jmm8qy385z2l6rdqnzclvqyjznahyll40s6cpspqa033h82hja4";
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
        version = "0.6.9";
        sha256 = "0r9s7vzjp2s8hi9njl4mjnrccalw7r14v37acvch0ybwz2g0ll5s";
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
        version = "10.36.0";
        sha256 = "028kp73vm012hp9z2rqf62qz51x2jlrcbr388dlnxn2v8knq24hw";
      }

      {
        name = "rust-analyzer";
        publisher = "matklad";
        version = "0.2.273";
        sha256 = "10gm823yh61js0kpbpqfy0r08j8jhgw5wbx4a01m83yz3n0csg15";
      }

      {
        name = "vscode-language-babel";
        publisher = "mgmcdermott";
        version = "0.0.29";
        sha256 = "1kwxhn5i227kb782l1i68jy169qq2ygfdnnjmcp4dgk4zzwyzzjv";
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
        version = "1.4.1";
        sha256 = "148mn0rf54akqf957w4xm404a5syk0y2adfslbsxll3h24m0v03h";
      }

      {
        name = "pyright";
        publisher = "ms-pyright";
        version = "1.1.63";
        sha256 = "1pwf27drzbbpvh05i3kiaijdz2cm7x2k627s0rz9d0xg1agnnxdx";
      }

      {
        name = "azure-account";
        publisher = "ms-vscode";
        version = "0.9.1";
        sha256 = "07d202ig44ysq0h1plk1mmyq2ysnyd9s2sd5fn8sy9slcad2xy73";
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
        version = "1.0.2619";
        sha256 = "1agks0b6phavvldpf1i3ss9ii78ivlycav26kv8wcjfwshcc2sn5";
      }

      {
        name = "debugger-for-chrome";
        publisher = "msjsdiag";
        version = "4.12.9";
        sha256 = "1banhpg90cp0rciq5m6l6f70h65qfhca0snn8409s56fmq8f2bj2";
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
        version = "0.65.0";
        sha256 = "1yqj3341n9yzp6h8bs8aknxw0gj67d3n1bal064rgnsmii68g9kk";
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
        version = "0.4.2";
        sha256 = "0vhj87ima482qmiwgk8hl3f8pql4rl8ywjbyy56i13k46zdv90mk";
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
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.27.1";
        sha256 = "0kgkb446v4ph5dlxa6x7clyq567mnzkb19625jyji3sh6dblqlnv";
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
        version = "0.24.0";
        sha256 = "17hvnyj6mazmshm78aql7xqr016a6vb748jdmyajl3crykry6kpf";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.24.0";
        sha256 = "1g9jd8h5civ8bs92ss3d31srah316xrk346ybl1qqpsspymqizk4";
      }
    ];
  };
}
