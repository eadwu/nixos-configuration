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
        version = "13.2.1";
        sha256 = "0vs2bd6fismsbsqsr24g3apdcs5lfh070nvp7r5i12yj6x88wb67";
      }

      {
        name = "vscode-sqlite";
        publisher = "alexcvzz";
        version = "0.13.0";
        sha256 = "17nx5chvl5gpgc5kgn0s4l0vbzjx8386iarq8kzifq3hzx9hwvlm";
      }

      {
        name = "vscode-bazel";
        publisher = "BazelBuild";
        version = "0.4.1";
        sha256 = "0rbaj9kj61kkksxrsmn1c16pg5fyz4sai6m2isx2y30q2mpaf8sw";
      }

      {
        name = "solargraph";
        publisher = "castwide";
        version = "0.23.0";
        sha256 = "0ivawyq16712j2q4wic3y42lbqfml5gs24glvlglpi0kcgnii96n";
      }

      {
        name = "path-intellisense";
        publisher = "christian-kohler";
        version = "2.4.0";
        sha256 = "0fqfxhn5ap2lvwnx5spybj1k55nifqnpaqr3ki2wcrbb0hkmg1l4";
      }

      {
        name = "vscode-eslint";
        publisher = "dbaeumer";
        version = "2.1.25";
        sha256 = "1g5kyv4y88asfary2ii2qkvb0hrg1n8x76nqykzd6df9g25vnnlw";
      }

      {
        name = "githistory";
        publisher = "donjayamanne";
        version = "0.6.18";
        sha256 = "01lc9gpqdjy6himn7jsfjrfz8xrk728c20903lxkxy5fliv232gz";
      }

      {
        name = "gitlens";
        publisher = "eamodio";
        version = "11.6.0";
        sha256 = "0lhrw24ilncdczh90jnjx71ld3b626xpk8b9qmwgzzhby89qs417";
      }

      {
        name = "vsc-material-theme";
        publisher = "Equinusocio";
        version = "33.2.2";
        sha256 = "0a55ksf58d4fhk1vgafibxkg61rhyd6cl10wz9gwg22rykx6i8d9";
      }

      {
        name = "vsc-material-theme-icons";
        publisher = "equinusocio";
        version = "2.2.0";
        sha256 = "0l8w1iid01va8aw5m9wwxvf2j1niw7m0bfdqf38lvfl14jif6nv5";
      }

      {
        name = "auto-rename-tag";
        publisher = "formulahendry";
        version = "0.1.8";
        sha256 = "08l010cl1vhci09wvzdzf8s0vja9hg83r9l4wx8f1xmq135m7zap";
      }

      {
        name = "copilot";
        publisher = "GitHub";
        version = "1.5.2864";
        sha256 = "0w46wcwfwnxzb7zdj1ixm0px4q812frg2lz9zvian7yb7bsk0q73";
      }

      {
        name = "vscode-pull-request-github";
        publisher = "GitHub";
        version = "0.30.0";
        sha256 = "1wz48p1r8fy6jr28v557v3982igd4mxnnmwhfmd54fcr6p3s2zv4";
      }

      {
        name = "go";
        publisher = "golang";
        version = "0.28.1";
        sha256 = "1fiycdss64izdxk7gnp1gx6bdl040cr5lk17cnb2p30qpgpjv0gz";
      }

      {
        name = "todo-tree";
        publisher = "Gruntfuggly";
        version = "0.0.214";
        sha256 = "0rwxjnrl44rnhx3183037k6435xs4772p58a37azl5cahsyav1hk";
      }

      {
        name = "haskell";
        publisher = "haskell";
        version = "1.7.1";
        sha256 = "11myrk3hcc2hdw2n07w092s78aa6igpm7rgvn7ac9rbkkvc66rsi";
      }

      {
        name = "r";
        publisher = "Ikuyadeu";
        version = "2.3.0";
        sha256 = "0blm54hy68c5xl53b9jmklpicl9w6i8w1xmn6qhmrynh4kbnik6v";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "8.20.2";
        sha256 = "1ygpw8lvdvyvg82gyyzmlvn71qx8dh9np64xzf4n1mz03n7ljccz";
      }

      {
        name = "nix-ide";
        publisher = "jnoortheen";
        version = "0.1.16";
        sha256 = "04ky1mzyjjr1mrwv3sxz4mgjcq5ylh6n01lvhb19h3fmwafkdxbp";
      }

      {
        name = "lean";
        publisher = "jroesch";
        version = "0.16.39";
        sha256 = "0v1w0rmx2z7q6lfrl430fl6aq6n70y14s2fqsp734igdkdhdnvmk";
      }

      {
        name = "language-julia";
        publisher = "julialang";
        version = "1.4.3";
        sha256 = "0a3qvnhxzkw0rqbaas2zhbxr7zn8sk01ar587gn22g86ad3n296j";
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
        version = "0.6.22";
        sha256 = "1zssccwf3cry2nmx98zws6iy0pryla9690ss8wzj41zplv08vaxq";
      }

      {
        name = "mips";
        publisher = "kdarkhan";
        version = "0.0.8";
        sha256 = "1985qki56f2dyxshg9zcy1lf3afw130hp8lw32sm6q301gn5bwbv";
      }

      {
        name = "noctis";
        publisher = "liviuschera";
        version = "10.40.0";
        sha256 = "1ry0vkyb92c6p6i8dpjq7sihvbpl45gngb8fym22nylmnfi9dcai";
      }

      {
        name = "rust-analyzer";
        publisher = "matklad";
        version = "0.2.760";
        sha256 = "08lh63n4s7fmf0bsj1lddzyrrac7z52w4ld1q8iak23hh6l8brrk";
      }

      {
        name = "vscode-language-babel";
        publisher = "mgmcdermott";
        version = "0.0.35";
        sha256 = "1163apwv60rhf67x8y28kqbhqdgqfr6hzp57ig0mq06bnf1x3r4s";
      }

      {
        name = "git-graph";
        publisher = "mhutchie";
        version = "1.30.0";
        sha256 = "000zhgzijf3h6abhv4p3cz99ykj6489wfn81j0s691prr8q9lxxh";
      }

      {
        name = "vscode-clang";
        publisher = "mitaki28";
        version = "0.2.4";
        sha256 = "0sys2h4jvnannlk2q02lprc2ss9nkgh0f0kwa188i7viaprpnx23";
      }

      {
        name = "vscode-filesize";
        publisher = "mkxml";
        version = "3.1.0";
        sha256 = "1zxdsqr5h0xl6arphi5i1xfgby4cin39jxpnmdgcg41p6qr3k3z7";
      }

      {
        name = "vscode-docker";
        publisher = "ms-azuretools";
        version = "1.17.0";
        sha256 = "01na7j64mavn2zqfxkly9n6fpr6bs3vyiipy09jkmr5m86fq0cdx";
      }

      {
        name = "vscode-pylance";
        publisher = "ms-python";
        version = "2021.9.4";
        sha256 = "1579h6zfrws55xh7cz4lg7p5j7r5awrlhk7b49mr3781q980zqbr";
      }

      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2021.9.1001294413";
        sha256 = "0j6lslrbsfzxa1n6gc5wyb0a9r152vmdmcrc44n8b8mmwasrs84x";
      }

      {
        name = "azure-account";
        publisher = "ms-vscode";
        version = "0.9.9";
        sha256 = "0sszld65z4jgcy17r1xjka7p0kfcg2xz1ysv47v07762hh2cv5wc";
      }

      {
        name = "hexeditor";
        publisher = "ms-vscode";
        version = "1.8.2";
        sha256 = "106k40gfcgjqcflnmdrr777wn0sb5m6fv1smsh692znd9bndf02k";
      }

      {
        name = "vs-keybindings";
        publisher = "ms-vscode";
        version = "0.2.1";
        sha256 = "1h7dihd6f39jcp27haiwbjdsymyi5p2v4f101lxdi5fafz3y6win";
      }

      {
        name = "vsliveshare";
        publisher = "ms-vsliveshare";
        version = "1.0.4836";
        sha256 = "1sigix4cdism09k53vd6vxa57mjkr9585n94vqnn9njlsfkbc4pf";
      }

      {
        name = "debugger-for-chrome";
        publisher = "msjsdiag";
        version = "4.13.0";
        sha256 = "0r6l804dyinqfk012bmaynv73f07kgnvvxf74nc83pw61vvk5jk9";
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
        version = "0.82.0";
        sha256 = "1r0xz8f7qyfzsbz5xl925vzi11xyzwd97wlyca3cybv3dr0pg5p2";
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
        version = "0.5.4";
        sha256 = "1a27yq29g9md98cm1gsb0sjw9hy1jsnqzxd91r7vq7infvcc1i26";
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
        version = "0.87.5";
        sha256 = "17v2cagm1ji8dh06izz64ssraigyi9zl8igbbznpbaabzvzcqwrs";
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
        version = "3.4.0";
        sha256 = "1x9rkyhbp15dwp6dikzpk9lzjnh9cnxac89gzx533681zld906m8";
      }

      {
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.36.0";
        sha256 = "1p9mymbf8sn39k44350zf3zwl29fhcwxfsqxr7841ch1qz88w9r8";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.18.5";
        sha256 = "0f4xvaiii4pd672iqxwd9s91rc5mmfx4p3l2mrhipvp4saxkd26k";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.32.0";
        sha256 = "0lq6daz228ipzls88y09zbdsv9n6backs5bddpdam628rs99qvn3";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.34.0";
        sha256 = "129d2n1w1dia3ck2abawb7n3dgx9vrbrnv67yshviyx5s0gh9878";
      }
    ];
  };
}
