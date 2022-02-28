final: prev:

with final.pkgs; {
  vscode-insiders-with-extensions = prev.vscode-insiders-with-extensions.override {
    vscodeExtensions = with vscode-extensions; [
      ms-python.python
      ms-vscode.cpptools
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
        version = "13.2.4";
        sha256 = "0376hs09wypn781s4cz3qb74qvsxck0nw1s39bfsgpqi0rgvwa9f";
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
        version = "2.8.0";
        sha256 = "04vardis9k6yzaha5hhhv16c3z6np48adih46xj88y83ipvg5z2l";
      }

      {
        name = "doxdocgen";
        publisher = "cschlosser";
        version = "1.4.0";
        sha256 = "1d95znf2vsdzv9jqiigh9zm62dp4m9jz3qcfaxn0n0pvalbiyw92";
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
        version = "0.1.10";
        sha256 = "0nyilwfs2kbf8v3v9njx1s7ppdp1472yhimiaja0c3v7piwrcymr";
      }

      {
        name = "copilot";
        publisher = "GitHub";
        version = "1.7.5118";
        sha256 = "1w8hisl0mp30y664y44nl942slbzch21gv3r10lbwvf9dyi8x5pr";
      }

      {
        name = "vscode-pull-request-github";
        publisher = "GitHub";
        version = "0.37.2022022414";
        sha256 = "0kpvcrrhcipwgqrdhi8jydblmv9689648qc22bfmslwy8x3jxqg9";
      }

      {
        name = "go";
        publisher = "golang";
        version = "0.31.1";
        sha256 = "1x25x2dxcmi7h1q19qjxgnvdfzhsicq6sf6qig8jc0wg98g0gxry";
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
        version = "2.3.8";
        sha256 = "12rqa4gsnrjmil805012hl1c3iv08hp6inr3bgkkr5qbqv5q3cyd";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "8.23.0";
        sha256 = "1rlw3ys6kwq46jc26iirpriwvrkmxs62mxi2arcn1y72wh1fqwi0";
      }

      {
        name = "better-cpp-syntax";
        publisher = "jeff-hykin";
        version = "1.15.13";
        sha256 = "1sm40wjiihi4f1zf748bfgp83ihxjrimkzv0xrvqdz3k8jfgn2ds";
      }

      {
        name = "nix-ide";
        publisher = "jnoortheen";
        version = "0.1.20";
        sha256 = "16mmivdssjky11gmih7zp99d41m09r0ii43n17d4i6xwivagi9a3";
      }

      {
        name = "lean";
        publisher = "jroesch";
        version = "0.16.46";
        sha256 = "1bwc9q4vn5hmrnjxzrwlf22wm1m627jmr31ywirimsxs1fxp5h84";
      }

      {
        name = "language-julia";
        publisher = "julialang";
        version = "1.5.11";
        sha256 = "1l5xkicdy2cg73904479yihvdjfy5zqrq7aykdzzi9axmyg19hkb";
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
        version = "0.6.27";
        sha256 = "1z5k65w0cs19xah76ndkw4f2bc0m9vdf0zdd9zqp0cin5mnspbad";
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
        version = "0.3.955";
        sha256 = "076zrngg4xqizhmwq6bqlhxj5xvf4bphxwzd2q3js4jdvxffcwhd";
      }

      {
        name = "vscode-language-babel";
        publisher = "mgmcdermott";
        version = "0.0.36";
        sha256 = "0v2xqry7pgwnzxi534v2rrbkfz9gvvbyc2px2g0xpbaaz3rrz6kd";
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
        version = "1.20.0";
        sha256 = "0a1v8hqbrl51pxbzvjd69azqcyqid4gmva3dnk440q7szr61hy4b";
      }

      {
        name = "vscode-pylance";
        publisher = "ms-python";
        version = "2022.2.4";
        sha256 = "1r46bq46dgs7jpmwadqapyy3lnh9fn9vj0x0hnzaf8i4bzkx0cfq";
      }

      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2022.2.1010571005";
        sha256 = "0sixl0ihga9r6i51vi4dw2vi6hgfys86nwdv54l6v35zggzxq337";
      }

      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.223.0";
        sha256 = "1s8ya31rq4k4l7nh8y1vdv58jqibcwghrshly07aapzfdil4lka5";
      }

      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.75.2022022515";
        sha256 = "1rgwg2q6l0y550hqbyiwj4g1grq03hm7m7xrv9xjiiymcdl0k5bx";
      }

      {
        name = "azure-account";
        publisher = "ms-vscode";
        version = "0.10.0";
        sha256 = "0mh85d8nzzpa1li9mnvj1py4h9igb3fy04lrrzvsp6zydfj03dc2";
      }

      {
        name = "cmake-tools";
        publisher = "ms-vscode";
        version = "1.9.2";
        sha256 = "12r360fr38qq1cvssg0ajhhipcaymbdjjd9dncy4fb02ajha823s";
      }

      {
        name = "hexeditor";
        publisher = "ms-vscode";
        version = "1.9.5";
        sha256 = "1wq2wlkwfdd9my3287hm53zi34izsbvv1ichgiprzkahqdxczybs";
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
        version = "1.0.5330";
        sha256 = "18sdbd1df09q0b6b5nn8vbh2qaa17ngplgq2rbns11lw11m98jyn";
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
        version = "1.3.0";
        sha256 = "00kwmgmc7xrdqh3klj3mdr5wfcbnj0djxxasx087pix4vfaf5bgn";
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
        version = "1.2.2";
        sha256 = "00v31vsp6nnw6zvv6a854cvzh63y9l712z57hh7na4x9if9pk9bg";
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
        version = "0.38.0";
        sha256 = "1r5j7gqrr8yx2dm2qsq269bvmzm48acczas57r67wr6zmqfll375";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.21.0";
        sha256 = "17ippn7pvmbijkqg8frnrpdb7hk1iqcd0nnv472hi8mndc7i4vq8";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.34.0";
        sha256 = "049fn36mhwdgkp11srym1lhvhrwil5lv3b9vg3chbgsd4sd1rszf";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.35.0";
        sha256 = "1xvxkj5jx2yrhal09nlpnh155qph44y35yn1zdyxcbisffv6x6mc";
      }

      {
        name = "vscode-wakatime";
        publisher = "WakaTime";
        version = "18.0.6";
        sha256 = "127w3150qgm5wbjrpi4fvs5a3jwhv7kbr3sfm8wf9274zv91mlvs";
      }
    ];
  };
}
