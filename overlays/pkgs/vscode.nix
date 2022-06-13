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
        version = "13.3.0";
        sha256 = "0mia2q1al9n0dj4icq0gcl07im7ix2090nj99q9jy5xwcavzpavj";
      }

      {
        name = "vscode-sqlite";
        publisher = "alexcvzz";
        version = "0.14.1";
        sha256 = "1iaklnhw74iwyjw74prnrx34ba25ra7ld71zlip04lv401329r4c";
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
        version = "2.8.1";
        sha256 = "1j7q4mzj173sl6xl3zjw40hnqvyqsrsczakmv63066k4k0rb6clm";
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
        version = "12.0.7";
        sha256 = "0g5kxc3b6hhxhjvmdviviy7yv615nqi92wqv1rg7wzv1vg565y40";
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
        version = "2.3.1";
        sha256 = "1djm4k3hcn4aq63d4mxs2n4ffq5x1qr82q6gxwi5pmabrb0hrb30";
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
        version = "1.28.6134";
        sha256 = "040pdqx84mfndkyjvs98kil41xlz0df9p9vgyfpan0lk8zry3yx3";
      }

      {
        name = "vscode-pull-request-github";
        publisher = "GitHub";
        version = "0.45.2022060915";
        sha256 = "081fvpv513491i3iq1qdsf01jkxyxzm3l7lj04lq3xmhr48smmp3";
      }

      {
        name = "go";
        publisher = "golang";
        version = "0.33.1";
        sha256 = "0dsjxs04dchw1dbzf45ryhxsb5xhalqwy40xw6cngxkp69lhf91g";
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
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "8.27.2";
        sha256 = "1aq98sqmfsglr0mi1ls4xp7fikhq61ammq9awg3bfcp5r3lx7jxi";
      }

      {
        name = "better-cpp-syntax";
        publisher = "jeff-hykin";
        version = "1.15.16";
        sha256 = "0r1pl2hc1p0rq1a4r61i09yk2vzq3fwxq55nn3gykdff0mda30i1";
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
        version = "0.16.52";
        sha256 = "0mky70ji7a4nlnp8p58zasz8q3kgdb2mr343h1zdzfy9sidf0g8n";
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
        version = "2022.6.11";
        sha256 = "0c785ff99hgzb83h3zab1avmnlx09l293n60g3qkmxsph7qyxlbw";
      }

      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2022.6.1001631011";
        sha256 = "0shc200l1dhysh0yhx9yg1gh0xprqp5vivsalwpnlaq1v3l4m715";
      }

      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.239.0";
        sha256 = "0568nlh3wd5gla62nv27bgadf23qv9fjf12r4ypryig8khx96ry9";
      }

      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.81.2022060215";
        sha256 = "1i5n669mpbsla6bd0q4h1zmv1zvp93sdpjmrh01098wps0d22ir4";
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
        version = "1.11.23";
        sha256 = "1ql2qcm8jsisxwdybhab7pi9m8ss1dkk7kimw96jr7njxhhh1xnc";
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
        version = "1.0.5615";
        sha256 = "13989czgcxqgvhavw7kh8rlfnrqbwzx5775r7hxhsi0ss6dazgk6";
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
        version = "1.8.2022061104";
        sha256 = "sha256-79cOBKdtxB4zY7eq5hLxPtVuP+hohxZ0p08jzst6szc=";
      }

      {
        name = "r";
        publisher = "REditorSupport";
        version = "2.5.0";
        sha256 = "1w9rq85ld9dc47vyhga6581l86h2vi0bqzzl8cq8bn1z64q5yiiq";
      }

      {
        name = "explorer-exclude-vscode-extension";
        publisher = "RedVanWorkshop";
        version = "1.2.0";
        sha256 = "02cfkyk0b7giasc9l08a1cj51spvcqc9qmndc48k1yanm4xhzxf9";
      }

      {
        name = "rust-analyzer";
        publisher = "rust-lang";
        version = "0.4.1090";
        sha256 = "sha256-yMAu6vHgqW5Cd5O7LXm/dBUATZYJ5/m7OIYvQoJcVzo=";
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
        version = "3.5.1";
        sha256 = "17xbbr5hjrs67yazicb9qillbkp3wnaccjpnl1jlp07s0n7q4f8f";
      }

      {
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.41.2022053107";
        sha256 = "1livypdid3bls1bd20335lnmas57dcjb3gqq4zh27bfaagqgx8zx";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.23.2022061300";
        sha256 = "0r3hm1l06ik8045ppndafqsw6206vcs0k9xr37ww9iizg5i0bddr";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.35.2022061102";
        sha256 = "1q8pzm9cyns2x3xqlpbwzj76hjyv07xx1b5g2gi0x5yg8h73a4fv";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.35.2022060703";
        sha256 = "17q0myk60gbhv47107iqkr8yzhjshqhpmydly2s3piw77p8phyzv";
      }

      {
        name = "vscode-wakatime";
        publisher = "WakaTime";
        version = "18.1.5";
        sha256 = "0j934rjna223ssbj0iiw3jsdini0gsrhb6j4sch5qn99f6n2g5a7";
      }
    ];
  };
}
