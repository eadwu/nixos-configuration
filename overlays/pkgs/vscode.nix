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
        version = "1.4.2";
        sha256 = "1d5gf61kz7s0my24g5vicm56h4crl4ayc4wxj2w8npnv4lsq8dgd";
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
        version = "0.1.6";
        sha256 = "005ff28d5b6ih7hxfjb7qd1qj4x3x2ndrv82bzj4naf421rxaz4b";
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
        version = "2.2.1";
        sha256 = "0jmm8qy385z2l6rdqnzclvqyjznahyll40s6cpspqa033h82hja4";
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
        version = "1.1.4";
        sha256 = "02m9vy39ip95cp8zzb20yyfh2kqfs0b5v6hnc2iyda2anqlzafbr";
      }

      {
        name = "auto-rename-tag";
        publisher = "formulahendry";
        version = "0.1.4";
        sha256 = "0lww2xx5h16kxx3awax1gg4v46zbx9gwkjlnrgwncmvqfn3jb6w9";
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
        version = "10.35.1";
        sha256 = "17xf2z0hhnnjhzjyajn6c7ss16wvymyc2ic55xkv9jz1bkix6g6w";
      }

      {
        name = "rust-analyzer";
        publisher = "matklad";
        version = "0.2.224";
        sha256 = "076kyhpj67vv12r3rn9vf1hm8xg222ch30xd4hvg29r1nlqhr3qm";
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
        version = "1.3.1";
        sha256 = "17q4727ah129hxdvrw1x0fcki7hidphmlnznxx7xvylcw937h6ch";
      }

      {
        name = "pyright";
        publisher = "ms-pyright";
        version = "1.1.49";
        sha256 = "1dkrvc6clra8m0b0nn5wr98aybxqb0p1ivyc5g23cqdi3f8vxsrm";
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
        version = "1.0.2427";
        sha256 = "0nin085zw3f5swwd9bznvxg4i7gkbpgv6pjbhsf5iy2k5plc0bk9";
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
        version = "0.63.0";
        sha256 = "0zwgfriahjriifv4jkrnn4p9zxamkvid97yvrckp495rh31j4nnq";
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
        version = "0.4.0";
        sha256 = "1fnrzj3jv2jwqc642zsd3jg8nb8j9189792dhwbdby1dfkyznss3";
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
        version = "0.26.0";
        sha256 = "1vymb8ivnv05jarjm2l03s9wsqmakgsrlvf3s3d43jd3ydpi2jfy";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.9.1";
        sha256 = "14b65bpgy8r2qm6fr06ph81qpv69yxdxpgx1lbg6xfhf0rp9mafw";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.23.0";
        sha256 = "0j74hl7zcr77vhz4nik4idh2j4p556rfdinrxpji2hai7kk47zrm";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.22.0";
        sha256 = "0fzh9m867kn6cc5d2vmmwq23vhlr80jazs01b8cxgpkipl1w3v4j";
      }
    ];
  };
}
