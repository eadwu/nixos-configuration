final: prev:

with final.pkgs; {
  vscode-insiders-with-extensions = prev.vscode-insiders-with-extensions.override {
    vscodeExtensions = with vscode-extensions; [
      (lib.hiPrio ms-python.python)
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
        version = "2.3.0";
        sha256 = "1wyp3k4gci1i64nrry12il6yflhki18gq2498z3nlsx4yi36jb3l";
      }

      {
        name = "vscode-eslint";
        publisher = "dbaeumer";
        version = "2.1.22";
        sha256 = "1h5j4qldvy8md5qsxmyi0v5f8zjz9w28mzlgkpdhx46hcpp6467i";
      }

      {
        name = "githistory";
        publisher = "donjayamanne";
        version = "0.6.16";
        sha256 = "15dzkf7qdpv8q4bdz6m9nnhrzrcg4bwqzlwa35117xlhrxx7gvb9";
      }

      {
        name = "gitlens";
        publisher = "eamodio";
        version = "11.5.0";
        sha256 = "1gisnap0jw3zlv8xp3gkwwyxszghlz4f9m0l1dvn87hz08l9d31a";
      }

      {
        name = "tslint";
        publisher = "eg2";
        version = "1.0.47";
        sha256 = "17i1j062jd3w2768w3mmqc92a51vqczg5k7rc605b7w92hr04ddp";
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
        version = "0.1.6";
        sha256 = "0cqg9mxkyf41brjq2c764w42lzyn6ffphw6ciw7xnqk1h1x8wwbs";
      }

      {
        name = "go";
        publisher = "golang";
        version = "0.25.1";
        sha256 = "0v0qxa9w2r50h5iivzyzlbznb8b9a30p1wbfxmxp83kkv4vicdb4";
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
        version = "1.4.0";
        sha256 = "1jk702fd0b0aqfryixpiy6sc8njzd1brd0lbkdhcifp0qlbdwki0";
      }

      {
        name = "r";
        publisher = "Ikuyadeu";
        version = "2.0.0";
        sha256 = "1dzdfdaxa10bsxd84kab62kn11s4cn2y8wj796qz81b748d0vzji";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "8.19.2";
        sha256 = "17jmwvj36pf207bv8nyi70vi5snskfnk7rbfcan79zl92g29id5z";
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
        version = "0.16.36";
        sha256 = "1ijzh82ka7k9pmzqax4ikmqv20yjmw7zi9vz2lizgsz6gdaylrj9";
      }

      {
        name = "language-julia";
        publisher = "julialang";
        version = "1.2.3";
        sha256 = "0zdd0vx2m4wax0zg3pmrs9bk5r2jdjbb8kz5a6pfchk001p6an14";
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
        version = "0.6.15";
        sha256 = "1c11q4l75sxrrl0s2xrjphkvzbn9pn0f221cldp7g72p87pyc5bx";
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
        version = "10.39.1";
        sha256 = "0950h2yx2iv177g0b5dfk6ql66r7axh9apydqx7iglcaziql6k82";
      }

      {
        name = "rust-analyzer";
        publisher = "matklad";
        version = "0.2.637";
        sha256 = "1bi9xklbls0jpccfg9bh3vk5s7v8f3a6f331b4hw0mpiv72ls5fr";
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
        version = "1.13.0";
        sha256 = "09iq528m3f8xa67daxyxddmg6xkzbbs2jps4hdni68j7jn0724y7";
      }

      {
        name = "vscode-pylance";
        publisher = "ms-python";
        version = "2021.6.1";
        sha256 = "1lv22z41rzbgy0b49c6avcy26747kw5533azbag4q12ylj67vn21";
      }

      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2021.7.928000153";
        sha256 = "1my40g8rmfj81r3a9maqsldwdlrg4rs1408r0ylqyhrwv3vgx6lz";
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
        version = "1.7.0";
        sha256 = "1cvwxnhrmzqn7spfr2igldraw24b18wx48fpxryb05v3rs89vphz";
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
        version = "1.0.4419";
        sha256 = "1r2xp8ggcrfsf4yzxjiss3hprk4dw7nchwxy920yn2iglvkaalsh";
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
        version = "0.79.2";
        sha256 = "08dcy108gnhq5z0i7fhgclwq67p956l4csl5xrmsa2vsqfn00q4z";
      }

      {
        name = "r-lsp";
        publisher = "REditorSupport";
        version = "0.1.15";
        sha256 = "0wpl8ri3s2z48wrzrw8p5pcwyc01b4a9gg7pkfj09d877z9gihs1";
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
        version = "0.5.3";
        sha256 = "0isw8jh845hj2fw7my1i19b710v3m5qsjy2faydb529ssdqv463p";
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
        version = "3.2.7";
        sha256 = "07n4zqpyzb77h3cvspaqqiyynw4s5yalqbhmvrdh6k7c2v9kmdqm";
      }

      {
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.34.0";
        sha256 = "0yjm39r5f8b0d1gb4xswk82wf05dryqq0dssa20j4klm9yhygz14";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.16.0";
        sha256 = "182gqg683v5w83vpcxbxicy4cs8xpafwxq88gr6v2zj9j0qhz40i";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.30.0";
        sha256 = "0vzkm0r4lz1cbf4z3zxysqgwxs7qfgq498isxmil033dbav9iy0j";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.31.0";
        sha256 = "1yyyf1zkwbba8kxpwcg7kibsv3jxnyh95h4i2kzavklrrkl1xpyf";
      }
    ];
  };
}
