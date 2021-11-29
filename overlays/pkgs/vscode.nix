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
        version = "2.5.0";
        sha256 = "0cmmjl22zpi39jip969sjl0axswff7j2f9j8w6ky5lswfir95hz4";
      }

      {
        name = "vscode-eslint";
        publisher = "dbaeumer";
        version = "2.2.2";
        sha256 = "17j4czb1lxgy62l0rsdf06ld3482cqplxglsh7p4zyp50p4samln";
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
        version = "1.7.3952";
        sha256 = "1kkgrjvy996hah5ly95vaywfjaibb0lcbf7md8by9r8s97sb2i8w";
      }

      {
        name = "vscode-pull-request-github";
        publisher = "GitHub";
        version = "0.32.0";
        sha256 = "0v5dhn0b0g9zfa0gj4l84zngnir8vlmyrkk9nfq839hgcdxyk9px";
      }

      {
        name = "go";
        publisher = "golang";
        version = "0.29.0";
        sha256 = "1ky5xnl300m42ja8sh3b4ynn8k1nnrcbxxhn3c3g5bsyzsrr1nmz";
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
        version = "2.3.3";
        sha256 = "026kczcfx1qj8azrfzskzqj24ig3wsal8lz7imncz83rgm9wiv0n";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "8.22.0";
        sha256 = "1j1qqwihzjlfs5w0nddd7msgi8r21jmgsyk2rg0abh9qi524f17f";
      }

      {
        name = "nix-ide";
        publisher = "jnoortheen";
        version = "0.1.18";
        sha256 = "1v3j67j8bydyqba20b2wzsfximjnbhknk260zkc0fid1xzzb2sbn";
      }

      {
        name = "lean";
        publisher = "jroesch";
        version = "0.16.40";
        sha256 = "1w72d775jprnmr4lqg32n0bm0a4ayybg9a8zlkykym5psdgw80yv";
      }

      {
        name = "language-julia";
        publisher = "julialang";
        version = "1.5.6";
        sha256 = "129m47vrhxyf4zhkfvkf5a810dkdnffiqiwryi9xp0ydpv0l8f41";
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
        version = "0.2.826";
        sha256 = "02vda5f0dxhwwypj6vq19qizj3k42q762k0dm5a1zjd11wq33496";
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
        version = "1.18.0";
        sha256 = "0hhlhx3xy7x31xx2v3srvk67immajs6dm9h0wi49ii1rwx61zxah";
      }

      {
        name = "vscode-pylance";
        publisher = "ms-python";
        version = "2021.11.2";
        sha256 = "0di2skybp8jw3apyd74ifsrsp02hr84j92jpgkipdqyqmis4bbmm";
      }

      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2021.11.1001506843";
        sha256 = "0bcfs1yg3zi9brcgsbxwzr9sjfib0h5kw4cib7fxsp3an4b7ymri";
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
        version = "1.0.5090";
        sha256 = "0pc4ls5w72vbf7lywd59rh7wf8icdz9w7czqzcnq5ic63452s3l1";
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
        version = "1.1.0";
        sha256 = "1m0iqc33gvigbh2xck0slv6l2xnl01d233afh0v2aragd0apfr32";
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
        version = "0.18.7";
        sha256 = "0klivkkhp7xb1s6nqkl3r1gac21mdpdgz9f381lk1321rzvnr0gm";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.33.0";
        sha256 = "0krsr3hhlyiscdxmrmp2m86wg514c3w252phqb79jlakv0264hrz";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.34.1";
        sha256 = "1mnlvnl2lg8fijxx4a6rqjix9k2j82js8kn8da7kjf4wh0ksdgvd";
      }
    ];
  };
}
