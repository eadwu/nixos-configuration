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
        version = "3.0.2";
        sha256 = "15w1ixvp6vn9ng6mmcmv9ch0ngx8m85i1yabxdfn6zx3ypq802c5";
      }
      
      {
        name = "Bookmarks";
        publisher = "alefragnani";
        version = "13.3.1";
        sha256 = "0q3zc84f4dl9zhsr6j569bm4jgyjlrzn9zf3fcpw871wnak8b509";
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
        version = "0.6.0";
        sha256 = "1lrj4ka1wh1fkb06rdky6l9mna7xfy1ngzm8faxk4av7m0bm2c51";
      }
      
      {
        name = "solargraph";
        publisher = "castwide";
        version = "0.24.0";
        sha256 = "0pcd4gwzg4rla5mz6kj4dqq30pyvsv6290an15yr89wxwcvk6qzf";
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
        version = "2.2.6";
        sha256 = "0m16wi8slyj09r1y5qin9xsw4pyhfk3mj6rs5ghydfnppb45w9np";
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
        version = "2022.11.1204";
        sha256 = "1a4mksa5sdm8975351pns9j9hdk83933wnd4lni5rylgrnjrl9ad";
      }
      
      {
        name = "vsc-material-theme";
        publisher = "Equinusocio";
        version = "33.5.0";
        sha256 = "1pr98mx7hji8jlm6ppac693ivbcpybh043w2z8sa3f49v7pksnrf";
      }
      
      {
        name = "vsc-material-theme-icons";
        publisher = "equinusocio";
        version = "2.4.0";
        sha256 = "0grqsb6snj8817saialdgx0ilblky5jw4i8yxaf8nymiysywzkyq";
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
        version = "1.58.7236";
        sha256 = "0is5jbmy6wwgnhghqp3i2qvrb482a9fnn2n0av00j3bx20mlwbd3";
      }
      
      {
        name = "vscode-pull-request-github";
        publisher = "GitHub";
        version = "0.55.2022111015";
        sha256 = "1i36i24nq0v7cq6gh89fqn48h79901mj52ngap7yb44h4i27s433";
      }
      
      {
        name = "go";
        publisher = "golang";
        version = "0.36.0";
        sha256 = "1h6h45789qwgxz6ci3alhjgfa9kl648dpp7wszpjfyy24rifz7sw";
      }
      
      {
        name = "todo-tree";
        publisher = "Gruntfuggly";
        version = "0.0.220";
        sha256 = "06kzb4msfdv11lij4dwbn1vxdxhvnpfcjqw0gvydgkqjy7dridjk";
      }
      
      {
        name = "haskell";
        publisher = "haskell";
        version = "2.2.1";
        sha256 = "14p9g07zsb3da4ilaasgsdvh3wagfzayqr8ichsf6k5c952zi8fk";
      }
      
      {
        name = "Ionide-fsharp";
        publisher = "Ionide";
        version = "7.4.0";
        sha256 = "1q331pgshvddd793g262w86w8ba9zkv7iqv72pk3bqqkh8kh383l";
      }
      
      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "9.0.1";
        sha256 = "17v6xb614wwd3ndfnv5jiri0ya3lmgxwknil5ckx24zxwyxjfpl4";
      }
      
      {
        name = "better-cpp-syntax";
        publisher = "jeff-hykin";
        version = "1.16.3";
        sha256 = "1fdchrm3i7qlhqnyi2icgcmi4b0kr27bp0mgys7iyswfqh3nfji7";
      }
      
      {
        name = "nix-ide";
        publisher = "jnoortheen";
        version = "0.2.1";
        sha256 = "0bibb3r4cb7chnx6vpyl41ig12pc0cbg0sb8f2khs52c71nk4bn8";
      }
      
      {
        name = "lean";
        publisher = "jroesch";
        version = "0.16.56";
        sha256 = "08l013kzfxgl1wajr6gfv3l64a7rh6n2x6m329m7crk74ib0sl06";
      }
      
      {
        name = "language-julia";
        publisher = "julialang";
        version = "1.38.2";
        sha256 = "1aaspv7zkmxwwqmxnskxw3vvjr4fr3vssgpjbyddkpw5ixscif07";
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
        version = "0.6.34";
        sha256 = "0cycs9pkl9pfgxnaj28p7f0cj3jpg5nbmwv0x1rqv279yw2xgf0i";
      }
      
      {
        name = "mips";
        publisher = "kdarkhan";
        version = "0.1.0";
        sha256 = "00i853yshgx9m8kprv6y5swz8i7rqqbvz9wd2dlnvfc4nsbn9y6m";
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
        version = "1.22.2";
        sha256 = "13scns5iazzsjx8rli311ym2z8i8f4nvbcd5w8hqj5z0rzsds6xi";
      }
      
      {
        name = "csharp";
        publisher = "ms-dotnettools";
        version = "1.25.2";
        sha256 = "sha256-l0dPzfdLOI+9haU08FAcEz91wa2zpC79dMrWfBVTnu4=";
      }
      
      {
        name = "dotnet-interactive-vscode";
        publisher = "ms-dotnettools";
        version = "1.0.3557011";
        sha256 = "1xvaj05lz8j83pbmdyx8pg2kmrrrmxdaayjhfn5v14l3h84jz4x3";
      }
      
      {
        name = "vscode-dotnet-pack";
        publisher = "ms-dotnettools";
        version = "1.0.9";
        sha256 = "1l4z67acnbygy9f75wq66gsvvh8ay2vnjv9nlc1i0w7qxl71lg72";
      }
      
      {
        name = "vscode-pylance";
        publisher = "ms-python";
        version = "2022.11.21";
        sha256 = "0fwsz0pggygifwpkclhzbfmccviy7bxq1yj3b7j48jmfjnnkmkc4";
      }
      
      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2022.11.1003161031";
        sha256 = "0xv4pm3shqmd2vkrsljbmn4wmrr2k3dqjjibjji0j7mpansndskw";
      }
      
      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.263.0";
        sha256 = "14a63a44ifppl4dsj5gqib7l918sj5kwhy5295b8d55yw4npbl3a";
      }
      
      {
        name = "remote-ssh";
        publisher = "ms-vscode-remote";
        version = "0.93.2022111115";
        sha256 = "0r578c93p07la1b8jmf6q1akil4k7ww5sbfrmhzcjrs4vd3fc4j0";
      }
      
      {
        name = "azure-account";
        publisher = "ms-vscode";
        version = "0.11.2";
        sha256 = "01mhw6nv63wj1l2p7jfxim4v691xdf5cww8r82cwq0n3dhsvih1a";
      }
      
      {
        name = "cmake-tools";
        publisher = "ms-vscode";
        version = "1.13.25";
        sha256 = "15yawsazr14zx3ndkkg620bzhwifcc51zxmq3rxq27bxwm9638zw";
      }
      
      {
        name = "hexeditor";
        publisher = "ms-vscode";
        version = "1.9.9";
        sha256 = "0w7b9llgm6plzpkr5g8ikpyxdgfdjcd5v9xzhp6967j0xphisdbb";
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
        version = "1.0.5762";
        sha256 = "1ar9bnv01wp4nkilznq6h9gjb2ndgb5rrb47k7r474nyzc77f2lv";
      }
      
      {
        name = "gremlins";
        publisher = "nhoizey";
        version = "0.26.0";
        sha256 = "1sfs98nxm5ylcjrmylr5y68ddml8cfg1q1wdm7wvhfhjqx4kig9h";
      }
      
      {
        name = "explorer-exclude";
        publisher = "PeterSchmalfeldt";
        version = "1.3.2";
        sha256 = "1khvs655dl0gn69azx1hzv9czli1kc7w18dfwirqkdibf1zxvg07";
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
        version = "1.13.2022111103";
        sha256 = "sha256-6qX0uWJcbI+2G3WNv+eN31u9P894KObujPEy+yFXFIQ=";
      }
      
      {
        name = "r";
        publisher = "REditorSupport";
        version = "2.6.1";
        sha256 = "1n5n4c5z9xihp3kpz0zxhg58zf8c49y50gn0fzzi1ir4xr5b5n9x";
      }
      
      {
        name = "rust-analyzer";
        publisher = "rust-lang";
        version = "0.4.1284";
        sha256 = "sha256-stORWjDJSIr3NqmWSw3wvNV3xrVUq0WzlGoPuat+anE=";
      }
      
      {
        name = "jinjahtml";
        publisher = "samuelcolvin";
        version = "0.19.0";
        sha256 = "0zmqbzmafgr9fv434vmgwlrs45a4jd2wr9zwc4nkqj106kr2rxsa";
      }
      
      {
        name = "scala";
        publisher = "scala-lang";
        version = "0.5.6";
        sha256 = "004zc3id5jk8hk6q27g4p36prvnlqdsgda0gd6xvs4gamhywhb3s";
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
        version = "1.2.3";
        sha256 = "0k1p9lzgcmdas23d33wm0x3n72kq0xicijzali167gdgnxbfvknf";
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
        version = "3.6.0";
        sha256 = "1sv8vlzmynbz20vmv901nrg12wcmsg5i9pm6mqq32rlgb7rw3p50";
      }
      
      {
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.46.2022103114";
        sha256 = "0rrf0arqm0h09bzj3xqljn40rbj3zjmla85ps6fabnw6ls4zwr0k";
      }
      
      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.25.2022110400";
        sha256 = "1ri42pkq6k549s6x4f2iay68r96xfn4xsir6yrw3chhj56113ipv";
      }
      
      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.37.2022090902";
        sha256 = "17i9jfwpjjxp81dg6nnviczzmr47pvz33zc4bwfvz69ckn6v74j4";
      }
      
      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.39.2022110307";
        sha256 = "14am9argn6lzwks2cp12mpnpspli95p23z0j2ij7flnqkr9019s8";
      }
      
      {
        name = "vscode-wakatime";
        publisher = "WakaTime";
        version = "22.0.0";
        sha256 = "03znz01msvpbij7xb751nlmbrdpjf1r65qkssia4v7ik871rml1n";
      }
    ];
  };
}
