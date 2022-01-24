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
        version = "13.2.2";
        sha256 = "17fyk8hr9ml0fx6qfyrkd0hbsb9r9s4s95w3yzly2glbwpwn5mm5";
      }

      {
        name = "vscode-sqlite";
        publisher = "alexcvzz";
        version = "0.14.0";
        sha256 = "1zdxk3004d29njvwxviddiw15v2zk6av8lhszhh064ck9bm6alfj";
      }

      {
        name = "vscode-bazel";
        publisher = "BazelBuild";
        version = "0.5.0";
        sha256 = "0gjf42xjhzwbncd6c8p7c60m44bkhk2kcpa3qjg2vr619p0i5514";
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
        version = "2.7.0";
        sha256 = "11jbaz8dlr9zmamikgii6pvbncsm61bhkipfarlqrisgfk99im9w";
      }

      {
        name = "vscode-eslint";
        publisher = "dbaeumer";
        version = "2.2.3";
        sha256 = "0sl9d85wbac3h79a5y5mcv0rhcz8azcamyiiyix0b7klcr80v56d";
      }

      {
        name = "githistory";
        publisher = "donjayamanne";
        version = "0.6.19";
        sha256 = "15s2mva9hg2pw499g890v3jycncdps2dmmrmrkj3rns8fkhjn8b3";
      }

      {
        name = "gitlens";
        publisher = "eamodio";
        version = "11.7.0";
        sha256 = "0apjjlfdwljqih394ggz2d8m599pyyjrb0b4cfcz83601b7hk3x6";
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
        version = "2.2.1";
        sha256 = "03mxvm8c9zffzykc84n2y34jzl3l7jvnsvnqwn6gk9adzfd2bh41";
      }

      {
        name = "auto-rename-tag";
        publisher = "formulahendry";
        version = "0.1.9";
        sha256 = "1xk8rzda16qgdxhq8bz6f8w09fd9044qczx1wfhszd6w3r4q9262";
      }

      {
        name = "copilot";
        publisher = "GitHub";
        version = "1.7.4688";
        sha256 = "0p3w6b1qkg7qc0y0q8ijfrvz3na8cyn0l63ij9cjphpnf9c0knii";
      }

      {
        name = "vscode-pull-request-github";
        publisher = "GitHub";
        version = "0.35.2022012009";
        sha256 = "0rbky4cy6r0nw32pqfjj854nj9kf3f5dc6v38mf4wvzmxd5nb6bj";
      }

      {
        name = "go";
        publisher = "golang";
        version = "0.30.0";
        sha256 = "15rmc79ad743hb6pmnzv91rkvl2fb1qwh5gk5q6n9f9vygiyjrix";
      }

      {
        name = "todo-tree";
        publisher = "Gruntfuggly";
        version = "0.0.215";
        sha256 = "0lyaijsvi1gqidpn8mnnfc0qsnd7an8qg5p2m7l24c767gllkbsq";
      }

      {
        name = "haskell";
        publisher = "haskell";
        version = "1.8.0";
        sha256 = "0yzcibigxlvh6ilba1jpri2irsjnvyy74vzn3rydcywfc17ifkzs";
      }

      {
        name = "r";
        publisher = "Ikuyadeu";
        version = "2.3.6";
        sha256 = "0gvxib2b8fz5q7pcilx0dbp6zk6z1vlr46l3zbbz3k3y9ajq9j53";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "8.23.0";
        sha256 = "1rlw3ys6kwq46jc26iirpriwvrkmxs62mxi2arcn1y72wh1fqwi0";
      }

      {
        name = "nix-ide";
        publisher = "jnoortheen";
        version = "0.1.19";
        sha256 = "1ms96ij6z4bysdhqgdaxx2znvczyhzx57iifbqws50m1c3m7pkx7";
      }

      {
        name = "lean";
        publisher = "jroesch";
        version = "0.16.44";
        sha256 = "1xhi9cmw07f09j80p57vwbbdilvlx782745fb9cbsmj7jb7yadw6";
      }

      {
        name = "language-julia";
        publisher = "julialang";
        version = "1.5.10";
        sha256 = "07rdx4sazfb59ccva2iw0l5ig085vjd3id4fplb02l6fq1p15wcx";
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
        version = "0.6.24";
        sha256 = "16yhdavg5lgc27jc2x1rl2fmshj654dgagmhf9h6wasyhrazjxad";
      }

      {
        name = "mips";
        publisher = "kdarkhan";
        version = "0.0.9";
        sha256 = "1cygc2f09z7q2fig1c2r7kmn7jx08v96952b0nmksfazblhmff5y";
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
        version = "0.3.915";
        sha256 = "sha256-4oNy0trc+w7tU8WXvnQbj0tqt+Y0pUq4Emqirs4jPkE=";
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
        version = "1.19.0";
        sha256 = "0qg4k5ivwa54i9f5ls1a0wl7blpymaq03dakdvvzallarip01qkf";
      }

      {
        name = "vscode-pylance";
        publisher = "ms-python";
        version = "2022.1.3";
        sha256 = "17v8dp8f39m2rbszlcmr0mnyjckycab4kzh5xpna4fz243rqmhl6";
      }

      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2022.1.1001727824";
        sha256 = "0hj04cgw5027nsghcjzp7gp4x55chimrbr1c1p7jnrial4yhrvgq";
      }

      {
        name = "azure-account";
        publisher = "ms-vscode";
        version = "0.9.11";
        sha256 = "0w389gqy6m35vdvl59x08wk2f63b8wllc8a1aclbs6hj9qrbg5ig";
      }

      {
        name = "hexeditor";
        publisher = "ms-vscode";
        version = "1.9.3";
        sha256 = "03093mx22ckcf0nrj1ik9ciqb2z6y8gidjny60a8lwqniihxw8qc";
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
        version = "1.0.5273";
        sha256 = "17q3k4c688nr29ihf0x9kizfchab6i74dkl3b66767czx07kkd1m";
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
        version = "1.2.0";
        sha256 = "sha256-YmR3FWhPZSU2gE6NIVoA1HZBzaYaTNYFXC/uNwbDEdQ=";
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
        version = "0.5.5";
        sha256 = "1gqgamm97sq09za8iyb06jf7hpqa2mlkycbx6zpqwvlwd3a92qr1";
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
        version = "1.2.1";
        sha256 = "0nq0bz8zyqjwxjg6g8rhkcx4lf75nkbn98dj90s43s0ykcqx0vzw";
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
        version = "3.4.1";
        sha256 = "1mr8si7jglpjw8qzl4af1k7r68vz03fpal1dr8i0iy4ly26pz7bh";
      }

      {
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.37.0";
        sha256 = "00dpjp9badb09a9md92vqc7vmgqp066q67bhg29sqsdyk8qn40wx";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.20.0";
        sha256 = "06h0xlmjm1lclql62qvb0ic12zs96nhb7b8zf4g1b7isssa9kasx";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.33.1";
        sha256 = "0j99gkhbp6qi8g58zjjp31bc168pfff0a93gik92bi8xwsc79g4l";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.34.2";
        sha256 = "00gzhk934r7n5byhxiybvrb4chpmprfxnwzh7by2fbfc046rgi29";
      }
    ];
  };
}
