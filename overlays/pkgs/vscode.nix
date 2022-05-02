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
        version = "3.0.0";
        sha256 = "17b7m50z0fbifs8azgn6ygcmgwclssilw9j8nb178szd6zrjz2vf";
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
        version = "12.0.6";
        sha256 = "1d7gzxsyxrhvvx2md6gbcwiawd8f3jarxfbv2qhj7xl1phd7zja3";
      }

      {
        name = "vsc-material-theme";
        publisher = "Equinusocio";
        version = "33.4.0";
        sha256 = "11ljird5ja3r0ada639k0bdfdfq2rx0q49nh42cpglg3djh4mn06";
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
        version = "1.14.5744";
        sha256 = "10a8pcdcm556r4w1rl8d8p1lxg6da7diw09jb9q0zl48zzjc2b3z";
      }

      {
        name = "vscode-pull-request-github";
        publisher = "GitHub";
        version = "0.41.2022042909";
        sha256 = "0y4nsgf6chlflds36008ff60h2f4ppb5zp0gki396091n2rq84ps";
      }

      {
        name = "go";
        publisher = "golang";
        version = "0.32.0";
        sha256 = "0a3pmpmmr8gd0p8zw984a73cp2yyi4lvz0s03msvkrxmn5k9xhis";
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
        version = "2.2.0";
        sha256 = "0qgp93m5d5kz7bxlnvlshcd8ms5ag48nk5hb37x02giqcavg4qv0";
      }

      {
        name = "r";
        publisher = "Ikuyadeu";
        version = "2.4.0";
        sha256 = "18xdxd0i9qc03yg9imm7cxk69ladmz8530w5bdf4kbk2lfvjl4cq";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "8.25.0";
        sha256 = "1nnxdzwmamyv4lbxmm1wn3fijlpacfcxwvkxqlfy28xw27xbn9a0";
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
        version = "1.6.17";
        sha256 = "1dk6i72zb6cpzlxns6q7h9cnbn587r3y148g4px6v5dyshk2s6xa";
      }

      {
        name = "language-haskell";
        publisher = "justusadam";
        version = "3.6.0";
        sha256 = "115y86w6n2bi33g1xh6ipz92jz5797d3d00mr4k8dv5fz76d35dd";
      }

      {
        name = "magit";
        publisher = "kahole";
        version = "0.6.29";
        sha256 = "04nf98c1z384zsxkydxv6lvcwzymp7g0x69h8csmpaa3pfydw208";
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
        version = "0.3.1037";
        sha256 = "sha256-joKHM7zFE1K88Y0lbr8dwxjJwj5Jwax5Ij9yBgMQ+8o=";
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
        version = "1.22.0";
        sha256 = "12qfwfqaa6nxm6gg2g7g4m001lh57bbhhbpyawxqk81qnjw3vipr";
      }

      {
        name = "vscode-pylance";
        publisher = "ms-python";
        version = "2022.4.3";
        sha256 = "0ykn0wy8qasafdl9dkwg5nhsq2w7i73f2iy1gy3gyav84r945d42";
      }

      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2022.4.1001211005";
        sha256 = "04m83w4qg84jb7kpjcb3ms663rzg7biwyakbqbk8xl2vfd1ngd40";
      }

      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.233.0";
        sha256 = "1xlczc788avyy1wnxlhgm2fbkxmw2dbbdlqalwpipn33w07gzpg0";
      }

      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.79.2022040715";
        sha256 = "041x9q2nb86p5npf5gjmg102phvm4s4nxmirfz7nfa2qlbn2rl74";
      }

      {
        name = "azure-account";
        publisher = "ms-vscode";
        version = "0.10.1";
        sha256 = "009rv9b7n9na3bz0y1xwk8bcsphvkrg94i6db3jijicd0w2yympz";
      }

      {
        name = "cmake-tools";
        publisher = "ms-vscode";
        version = "1.11.14";
        sha256 = "0qfpxv0xlp8x5xhh5l7a9p7kvn52hkis4q0b17xp131c4n1sz3yz";
      }

      {
        name = "hexeditor";
        publisher = "ms-vscode";
        version = "1.9.6";
        sha256 = "0yir356rsxdn9vyk0q640ag6lxwhkx123gv1yp0058v9ccxym1hn";
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
        version = "1.0.5527";
        sha256 = "0364wcq15cw8k4ka92bn8b2w6yc6jvqsl4n0nsrani3a9wngswrd";
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
        version = "1.5.0";
        sha256 = "sha256-VT6to8EPqE40SbgCQh0SawypIqhs1CNGhoUtkcINI50=";
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
        version = "0.17.0";
        sha256 = "120z8barzgva0sr1g7xj4arpjz96v4zxh2zgk56jzdgnafzyq71b";
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
        version = "3.4.2";
        sha256 = "1ifz0iyc7zknb07qx2fixg3qw9i69pvr12rlg2yvg1s8paj8mnbx";
      }

      {
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.40.2022041411";
        sha256 = "0vfzv213vdigk8lzyhc5kmlwfvcnnqxffrnpb7nxagzd86hyphqc";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.22.2022042300";
        sha256 = "1gj3n1vb20ph6cjhsgaq781qcn0a9rmhpah3ii7sxxh99182qbwh";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.35.2022042302";
        sha256 = "0ismggiv56jvyg3xgic2qwskxs9s442hni4wnm0lnia013dd2s8c";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.35.2022042603";
        sha256 = "0wi57x6l0jzfic34wsm0393xac1qkg2dskn5qjqs9hrc0xs1fc6a";
      }

      {
        name = "vscode-wakatime";
        publisher = "WakaTime";
        version = "18.1.2";
        sha256 = "0y2v4jpl4v4kq3xly42ddy7plxagigiy217nlpd15683jqimdliy";
      }
    ];
  };
}
