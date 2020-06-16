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
        version = "32.6.0";
        sha256 = "0x45rfdha16jvz7xw88zw4gjh6p658nrcjw6ix81r9gh180prsq6";
      }

      {
        name = "r";
        publisher = "Ikuyadeu";
        version = "1.4.1";
        sha256 = "12x7vylz42ri6vbhb7hyiz46a6q983912yb02xl7bh6nma72myla";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "8.10.0";
        sha256 = "0kcrxykvv21ra1xwws6s2clxfnjngpais1ddlimmmcia0y426dxg";
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
        version = "0.1.3";
        sha256 = "0jrp1rsgmi0js0lfzyv1bmpnql2ry9h5k4cvif5r35ifnw72ard0";
      }

      {
        name = "language-haskell";
        publisher = "justusadam";
        version = "3.2.1";
        sha256 = "0lxp8xz17ciy93nj4lzxqvz71vw1zdyamrnh2n792yair8890rr6";
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
        version = "0.2.207";
        sha256 = "1x2i8b7qmwrz1dhmpkhf36ibvhw1ysf98ps07d7g2zjdm65a22m0";
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
        version = "1.3.0";
        sha256 = "16r8qdjxsd63cxzn0hz3s56j1cxmbx5vbnl049capid1nvvnfcx8";
      }

      {
        name = "pyright";
        publisher = "ms-pyright";
        version = "1.1.42";
        sha256 = "098zv5229zmghah7cn90j4jipmfbnlxfyys1m5jypwq8z9pwiyks";
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
        version = "1.0.2302";
        sha256 = "14rd593n37g26883x5g23brl7lgnsc8qjxl09vs5fwy9k3h4bjc1";
      }

      {
        name = "debugger-for-chrome";
        publisher = "msjsdiag";
        version = "4.12.8";
        sha256 = "14dkyj7wl8iagradjs8vi0qv42clkjwkknfyqlng0w30q9gk133a";
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
        version = "0.62.0";
        sha256 = "1qgnv558cmyy5mjhj1m7bzn78r6qqrh28rd28c6yici7mz883n0x";
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
