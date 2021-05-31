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
        version = "13.0.4";
        sha256 = "1h5h5d0dpsnhagiqbf3g5hzgcf2nlwiddrg4kvmgll6zd3rix21w";
      }

      {
        name = "vscode-sqlite";
        publisher = "alexcvzz";
        version = "0.12.0";
        sha256 = "1r1wax2ipf2gdd33jrn287zvv5wj7dv5l7i45df24ljynqxl2vf8";
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
        version = "2.1.20";
        sha256 = "0xk8pxv5jy89fshda845iswryvmgv0yxr11xsdbvd9zdczqhg7wc";
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
        version = "11.4.1";
        sha256 = "1gqkcv210h595rxwqsgwywjg2c2xnxdjlpqmgg091hd36g7jhcrs";
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
        version = "1.6.6";
        sha256 = "18h8wbi5n61iby70hysks8jamxc87z99yzxf42qgjwaw5fih02vc";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "8.18.0";
        sha256 = "0krdkma1fr0x07qlifv1qj2qv2isv72i47by5dmkzfsgz2ha98nr";
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
        version = "0.16.33";
        sha256 = "1dkpcsxdls4d8zajwn8g5cjb0yp1s2h9hnyv9by6ldx5d1s7a9s2";
      }

      {
        name = "language-julia";
        publisher = "julialang";
        version = "1.1.40";
        sha256 = "0a2ywyif4ryxsj42sh5sng2vb1ixdarvla47svdzk7x1s9iyc26b";
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
        version = "0.6.13";
        sha256 = "0n8g201rikdfm7czrckc2czrzwvkqm2rj06pxdja04hlbm0qc9zx";
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
        version = "0.2.612";
        sha256 = "0a87lnhzpzlni8b33hdskifi0qir88rnmfbzgsy4m5ahs8isw6az";
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
        version = "2021.5.4";
        sha256 = "1lyyhrqp3b9a235k14wf5a8lyrx00gz861almjvkgvacds7vvs8b";
      }

      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2021.6.885080120";
        sha256 = "1vnpqhmfhywj1jmgbkx1db9kcacwl09hggjgddvd55ybnqic5cvj";
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
        version = "1.6.0";
        sha256 = "10bs2l5ihfk3q506vj1qcv85csg9ivwk2jl3l01b84hdhpwk7p0j";
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
        version = "1.0.4272";
        sha256 = "0dhs9lkprz2q79kpkj2d22d09lvhl77n38vj0rsz80g9vj41jzwh";
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
        version = "3.2.6";
        sha256 = "0am6qrwgxkn59rh62clh29vb0h5s8xq5g7v915ngj0m0m79gr2z3";
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
        version = "0.15.0";
        sha256 = "1carhii8vj0zlv2kqkkidkrd66v0h5k9fl7y82cdh8lrspapz4xr";
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
