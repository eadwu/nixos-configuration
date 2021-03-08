final: prev:

with final.pkgs; {
  vscode-insiders-with-extensions = prev.vscode-insiders-with-extensions.override {
    vscodeExtensions = with vscode-extensions; [
      ms-python.python
      ms-vscode.cpptools
      WakaTime.vscode-wakatime
    ] ++ vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "better-comments";
        publisher = "aaron-bond";
        version = "2.1.0";
        sha256 = "0kmmk6bpsdrvbb7dqf0d3annpg41n9g6ljzc1dh0akjzpbchdcwp";
      }

      {
        name = "Bookmarks";
        publisher = "alefragnani";
        version = "13.0.3";
        sha256 = "1cpx4lmpzh5xav56bgig82xcc0csfvvyjvkfzlsh8y5ljwa1qlbl";
      }

      {
        name = "vscode-sqlite";
        publisher = "alexcvzz";
        version = "0.11.1";
        sha256 = "1qcszjmjady47vggfa93wr6pl2iqvp66hxf75gf9iz2l5wmz267w";
      }

      {
        name = "vscode-bazel";
        publisher = "BazelBuild";
        version = "0.4.0";
        sha256 = "0p018878pxr7vxr6375fywchzq1xwvxnjrb4zvp444s6p3sknxxg";
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
        version = "2.1.14";
        sha256 = "113w2iis4zi4z3sqc3vd2apyrh52hbh2gvmxjr5yvjpmrsksclbd";
      }

      {
        name = "githistory";
        publisher = "donjayamanne";
        version = "0.6.14";
        sha256 = "11x116hzqnhgbryp2kqpki1z5mlnwxb0ly9r1513m5vgbisrsn0i";
      }

      {
        name = "gitlens";
        publisher = "eamodio";
        version = "11.3.0";
        sha256 = "0py8c5h3pp99r0q9x2dgh1ryp05dbndyc5ipp999z3x1xvwnfrlv";
      }

      {
        name = "tslint";
        publisher = "eg2";
        version = "1.0.44";
        sha256 = "11q8kmm7k3pllwgflsjn20d1w58x3r0vl3i2b32bnbk2gzwcjmib";
      }

      {
        name = "vsc-material-theme";
        publisher = "Equinusocio";
        version = "33.1.2";
        sha256 = "14db0xmhcrk0lxafcgiqqzi1ydhiy16hs4r9g0jcdglj8bn6y624";
      }

      {
        name = "vsc-material-theme-icons";
        publisher = "equinusocio";
        version = "1.2.2";
        sha256 = "06xfv8ggli88zg1hyrd7m494fl6bz4fspbxy626nsswq4f26msms";
      }

      {
        name = "auto-rename-tag";
        publisher = "formulahendry";
        version = "0.1.6";
        sha256 = "0cqg9mxkyf41brjq2c764w42lzyn6ffphw6ciw7xnqk1h1x8wwbs";
      }

      {
        name = "go";
        publisher = "golang";
        version = "0.23.0";
        sha256 = "0ngf0cx582m51arnna5z59sjrhh7vz9ic39gh57b8m94mr8ld77p";
      }

      {
        name = "todo-tree";
        publisher = "Gruntfuggly";
        version = "0.0.201";
        sha256 = "1hjck1r2byc45rp28gn15wbmcrl1wjng7kn5lyhr6mgjjwqh5pa8";
      }

      {
        name = "haskell";
        publisher = "haskell";
        version = "1.2.0";
        sha256 = "0vxsn4s27n1aqp5pp4cipv804c9cwd7d9677chxl0v18j8bf7zly";
      }

      {
        name = "r";
        publisher = "Ikuyadeu";
        version = "1.6.4";
        sha256 = "0zz8x6v9q9n8rzf6qrxz4hz3bwz9xmb4nksb0c9mj1bx5ljgaalp";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "8.16.1";
        sha256 = "0dpnf6z7003br5j7sxxr5v29nx3gcpyrlmmn9kzaicqxl8nzj6v9";
      }

      {
        name = "nix-ide";
        publisher = "jnoortheen";
        version = "0.1.7";
        sha256 = "1bw4wyq9abimxbhl7q9g8grvj2ax9qqq6mmqbiqlbsi2arvk0wrm";
      }

      {
        name = "lean";
        publisher = "jroesch";
        version = "0.16.24";
        sha256 = "1ph5hi0sldkczdbsmscndpqi4yrgpc3v0knfx9wfc7s6h5zydw6c";
      }

      {
        name = "language-julia";
        publisher = "julialang";
        version = "1.1.32";
        sha256 = "0515x1s0d30w3sinpk05499f2cynipc8193zr2bfj75qff8pv1rx";
      }

      {
        name = "language-haskell";
        publisher = "justusadam";
        version = "3.4.0";
        sha256 = "0ab7m5jzxakjxaiwmg0jcck53vnn183589bbxh3iiylkpicrv67y";
      }

      {
        name = "magit";
        publisher = "kahole";
        version = "0.6.5";
        sha256 = "0zmv15lxcl71qprfjwlawinz3mp1gba4qr7wms98xx0g6ibfw9wn";
      }

      {
        name = "mips";
        publisher = "kdarkhan";
        version = "0.0.6";
        sha256 = "0bd1nl24aja2hky415y2mkn18kalyr9id7kyhypgqfwpsrvcdgpk";
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
        version = "0.2.505";
        sha256 = "1lbq2nn8cjq0mx2k2nx3s43nc6ah82bcsh93dk0ss8mns06cn85a";
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
        version = "1.29.0";
        sha256 = "02x4nc7snsr1d1lrybgjmq85qbb2jma3rvv3v5lcry44wd9pqcs5";
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
        version = "1.10.0";
        sha256 = "0kryrvs1gm2d3kj378gsszhn4dkkgv34vir4gky7347jw2rmg7rb";
      }

      {
        name = "vscode-pylance";
        publisher = "ms-python";
        version = "2021.3.0";
        sha256 = "0bpyhp3vafqffdpaidn3ii79q3yihwfsq14mm7pak9xmr9hf2xv4";
      }

      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2021.4.625511240";
        sha256 = "1q1kvgpp0l0wnlbfa8vnbhyja9wqm4hx4qk8mbwaxcx5s9paky5k";
      }

      {
        name = "azure-account";
        publisher = "ms-vscode";
        version = "0.9.7";
        sha256 = "1xvjn88kg4fn0swk1hwwqh1yxafbcr095x96fvr216dakpl6rpzm";
      }

      {
        name = "hexeditor";
        publisher = "ms-vscode";
        version = "1.4.0";
        sha256 = "1hs2q6vpj1b3pw7y439isjsjgqrfgi04680mql1b5yiq1n9g86c0";
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
        version = "1.0.3912";
        sha256 = "1k5yy04q85jjr7hzrv0s7x1m2251kglb038wcvvbs568vpscghi8";
      }

      {
        name = "debugger-for-chrome";
        publisher = "msjsdiag";
        version = "4.12.12";
        sha256 = "0nkzck3i4342dhswhpg4b3mn0yp23ipad228hwdf23z8b19p4b5g";
      }

      {
        name = "gremlins";
        publisher = "nhoizey";
        version = "0.26.0";
        sha256 = "1sfs98nxm5ylcjrmylr5y68ddml8cfg1q1wdm7wvhfhjqx4kig9h";
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
        version = "0.28.1";
        sha256 = "179g7nc6mf5rkha75v7rmb3vl8x4zc6qk1m0wn4pgylkxnzis18w";
      }

      {
        name = "java";
        publisher = "redhat";
        version = "0.76.0";
        sha256 = "0xb9brki4s00piv4kqgz6idm16nk6x1j6502jljz7y9pif38z32y";
      }

      {
        name = "r-lsp";
        publisher = "REditorSupport";
        version = "0.1.14";
        sha256 = "0x85mg25ixafg18pgqzrwm4hi0ggjhcsznlkp0rpcca6vq8mrapf";
      }

      {
        name = "explorer-exclude-vscode-extension";
        publisher = "RedVanWorkshop";
        version = "1.2.0";
        sha256 = "02cfkyk0b7giasc9l08a1cj51spvcqc9qmndc48k1yanm4xhzxf9";
      }

      {
        name = "jinjahtml";
        publisher = "samuelcolvin";
        version = "0.16.0";
        sha256 = "17f4dzwsqpwdkzc9f35sx31mvb4zns2ya0ym7mjgl8iy1kyci66q";
      }

      {
        name = "scala";
        publisher = "scala-lang";
        version = "0.5.2";
        sha256 = "1b8ydigspgr2cni86cqrd0md61ks62y9qca3ia6dq11pvfdwxbsd";
      }

      {
        name = "shader";
        publisher = "slevesque";
        version = "1.1.5";
        sha256 = "14yraymi96f6lpcrwk93llbiraq8gqzk7jzyw7xmndhcwhazpz9x";
      }

      {
        name = "vscode-stylelint";
        publisher = "stylelint";
        version = "0.86.0";
        sha256 = "06wvrm4n39zv1qvzv4askw5329dnjnfmg6qrcdbywmafxjpkk30x";
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
        version = "3.2.4";
        sha256 = "0caxmf6v0s5kgp6cp3j1kk7slhspjv5kzhn4sq3miyl5jkrn95kx";
      }

      {
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.31.0";
        sha256 = "0gdk0y2ckqwccvcz50c7954kzlbmz21khr2v5ks4waqskjv5viry";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.12.1";
        sha256 = "1xx84qg1jvhdxlrr3iki5zaggzm25a41vpdkxjdbkzfq41l1w6p1";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.28.0";
        sha256 = "1cfjzc53dv2paidrfvllk6m0k1fdfaz47wsdz59aadn8ga484672";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.27.1";
        sha256 = "0f3cq09hjds3rrpbyijm4z1fwy92l62cdbr8nkb3sayjxskci39q";
      }
    ];
  };
}
