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
        version = "13.1.0";
        sha256 = "0h90vbl7v45k3vdkl60ab4hhqc7k47yhh2rznpja787kjbhkjgkn";
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
        version = "2.1.23";
        sha256 = "1wqcnbj1ckifxfw951sfhq2vyliac10i9101mk46jli36mihkjgi";
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
        version = "2.0.10";
        sha256 = "0ki9x63wvc1h44cy5g9i96zkmcy1a3wc4sqzw3an17qad1lsicwb";
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
        version = "1.3.2283";
        sha256 = "0api62ww5fv2fm6a0z2bqsqzn2ha0fqm29pa5941f9lr4vprxaax";
      }

      {
        name = "vscode-pull-request-github";
        publisher = "GitHub";
        version = "0.29.0";
        sha256 = "1isg0s0zlsg6lshihjxk2kjccaprjw8x7xhqsxqk739ld13ahvlx";
      }

      {
        name = "go";
        publisher = "golang";
        version = "0.26.0";
        sha256 = "1lhpzz68vsxkxwp12rgwiqwm1rmlwn6anmz6z4alr100hxxx31h7";
      }

      {
        name = "todo-tree";
        publisher = "Gruntfuggly";
        version = "0.0.213";
        sha256 = "0fj7vvaqdldhbzm9dqh2plqlhg34jv5khd690xd87h418sv8rk95";
      }

      {
        name = "haskell";
        publisher = "haskell";
        version = "1.6.0";
        sha256 = "01f87wn7lnrh9cyk6yxdv91bn9z6a9c6h62vxznqd6ff5ryv2fiw";
      }

      {
        name = "r";
        publisher = "Ikuyadeu";
        version = "2.1.0";
        sha256 = "1nzg1cqsi5966b7950a1kydxwm2x5fgc5gscjvz93ilvq6s55ll3";
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
        version = "0.1.12";
        sha256 = "1wkc5mvxv7snrpd0py6x83aci05b9fb9v4w9pl9d1hyaszqbfnif";
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
        version = "1.3.27";
        sha256 = "1sgb73x1a1s1pg5zf55b7p7fh8dn4n751mv5dpjznp0akb2phakf";
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
        version = "0.6.18";
        sha256 = "0sqzz5bbqqg60aypvwxcqnxrr72gmwfj9sv0amgkyaf60zg5sf7w";
      }

      {
        name = "mips";
        publisher = "kdarkhan";
        version = "0.0.7";
        sha256 = "11fqicr0i0sq0dkq70fapp11r5szw9ny7nxiima3dy3mdylh3a8z";
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
        version = "0.2.694";
        sha256 = "10z247zcx4338ddakd3pnnijn0qh9d52sv0d154dkjwrn9shq5iz";
      }

      {
        name = "vscode-language-babel";
        publisher = "mgmcdermott";
        version = "0.0.31";
        sha256 = "02qjcfa1m2crrp5j1aykh7g6npzqi2hppgpgxqszs4vmisvkfpf4";
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
        version = "1.15.0";
        sha256 = "0rbd2pp4k4q2781jxfc87mxxj4m0gs4nrl2d1fa0aljgw4fln17j";
      }

      {
        name = "vscode-pylance";
        publisher = "ms-python";
        version = "2021.8.0";
        sha256 = "0vyd6l8b51srycmb1pn5c0wkhc4jp5qp40qfzh9y9b7fh25kwqxc";
      }

      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2021.8.1195043623";
        sha256 = "0ki7xa9lf8wy32rrd404gb6m3cyh0jn1n8p5izvl1q8rf9i591nf";
      }

      {
        name = "azure-account";
        publisher = "ms-vscode";
        version = "0.9.8";
        sha256 = "0xbs1a685r0mwhri2lnpay9yi0bqxwaa1m0s4p9li8nq25j83gdx";
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
        version = "1.0.4673";
        sha256 = "1ys3lilc2r3n250s6pfvadrabnvqpzy74awjmvw79jrbvvk1iw1z";
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
        version = "0.80.0";
        sha256 = "0gyp0sw6n6qbhww9liwv153cp9cy717hl1vr7z6zy5mbaanmyyrb";
      }

      {
        name = "r-lsp";
        publisher = "REditorSupport";
        version = "0.1.16";
        sha256 = "1qnb9kj4j99kw7mxgznn0ayi9dfyr1whv9k228wrzwc9af2i1nl1";
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
        version = "3.4.0";
        sha256 = "1x9rkyhbp15dwp6dikzpk9lzjnh9cnxac89gzx533681zld906m8";
      }

      {
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.35.0";
        sha256 = "01sskdm7fizzh6d8bzgdmj9pmrshvh58ks0l6qyf0gr2ifnhli57";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.18.2";
        sha256 = "1v9i6rrhddbjdlz034hq3wib3y9hmlvf2ryy6n0j6fiprqfi9si3";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.31.0";
        sha256 = "07zx8mry7lm9r4cl3ffkmxp5ifbkpyzh29cfxvhfkd1bbn6pxkfq";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.32.2";
        sha256 = "0hn37li6wv5w0m92svr1bmmspwrwcn7k7bm59a58kfgs5j8sccax";
      }
    ];
  };
}
