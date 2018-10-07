self: super:

{
  vscode = (super.vscode-with-extensions.overrideAttrs (oldAttrs: {
    name = super.vscode.name;
  })).override {
    vscode = super.vscode;
    vscodeExtensions = with super.vscode-extensions; [
      bbenoist.Nix
      ms-vscode.cpptools
      ms-python.python
      WakaTime.vscode-wakatime
    ] ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "better-comments";
        publisher = "aaron-bond";
        version = "2.0.1";
        sha256 = "0jjkv9azh88qismgfb0q28vxwz2pl08qa8qqmb29wb7aywsxhbc4";
      }

      {
        name = "solargraph";
        publisher = "castwide";
        version = "0.17.6";
        sha256 = "1n1z9kgygd12120didqnmbsclq4lj041r8amjksfnyi8mg8ysl4r";
      }

      {
        name = "path-intellisense";
        publisher = "christian-kohler";
        version = "1.4.2";
        sha256 = "0i2b896cnlk1d23w3jgy8wdqsww2lz201iym5c1rqbjzg1g3v3r4";
      }

      {
        name = "vscode-eslint";
        publisher = "dbaeumer";
        version = "1.6.0";
        sha256 = "0hm32c5ah95c9nmgibp5zl80f5jbx112b6m755z67qyvlhvincq9";
      }

      {
        name = "githistory";
        publisher = "donjayamanne";
        version = "0.4.3";
        sha256 = "12vhs0jrzqh1gq38qfq0h3pfpnan01sx4a4ik14hdby0558han9j";
      }

      {
        name = "jupyter";
        publisher = "donjayamanne";
        version = "1.1.4";
        sha256 = "02ldh8p6sd9x83j7xvs1lp4caxnrnxkrsixig9gadqfxh12p24cy";
      }

      {
        name = "gitlens";
        publisher = "eamodio";
        version = "8.5.6";
        sha256 = "1vn6fvxn4g3759pg9rp8hqdc58pgyvcdma1ylfwmdnipga37xfd3";
      }

      {
        name = "tslint";
        publisher = "eg2";
        version = "1.0.39";
        sha256 = "1al61xzz7p6rqgk7rplg3njj4hyiipx7w89pqfn8634skw7r32rl";
      }

      {
        name = "vsc-material-theme";
        publisher = "Equinusocio";
        version = "2.4.2";
        sha256 = "1cl9xy9pg0jvgpz4ifvb9n6lv1xcsnrsh56xmz2hr6901n4gk70p";
      }

      {
        name = "prettier-vscode";
        publisher = "esbenp";
        version = "1.6.1";
        sha256 = "04nq5r1s5kacqfn7vrsdwps4jr58nnvm9hrircnp2mp94wal9wsj";
      }

      {
        name = "auto-rename-tag";
        publisher = "formulahendry";
        version = "0.0.15";
        sha256 = "1hgd7y8fyzrphn166vmmsm9kqcl7n8gw4xi8rd24imwbswvh0mgi";
      }

      {
        name = "vscode-pull-request-github";
        publisher = "GitHub";
        version = "0.1.6";
        sha256 = "08r0i265q4gk6kmz3ynxglhssdk5020bifagl9jr8spfs5sacnsx";
      }

      {
        name = "Ionide-FAKE";
        publisher = "Ionide";
        version = "1.2.3";
        sha256 = "0ijgnxcdmb1ij3szcjlyxs2lb1kly5l26lg9z2fa7hfn67rrds29";
      }

      {
        name = "Ionide-fsharp";
        publisher = "Ionide";
        version = "3.27.0";
        sha256 = "172r5s9mx2favkqsv83dmr7cwb02p0x0sm1cfa0fzml2q96v7wv1";
      }

      {
        name = "Ionide-Paket";
        publisher = "Ionide";
        version = "1.12.0";
        sha256 = "10ik4jhvh05363swdfnr7phlnsndypaq3bkrl612z2kvv38q5kl7";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "5.11.1";
        sha256 = "0hjjd36aikk98pczsyra1nylhpyj7b2z5jfja01sws0cqlqsqz9q";
      }

      {
        name = "horizon-theme-vscode";
        publisher = "jolaleye";
        version = "1.4.0";
        sha256 = "1q3zg5228w3zfqapdajjcjda7axsvpsp0s5g7d5nipb1fasr46nk";
      }

      {
        name = "language-haskell";
        publisher = "justusadam";
        version = "2.5.0";
        sha256 = "10jqj8qw5x6da9l8zhjbra3xcbrwb4cpwc3ygsy29mam5pd8g6b3";
      }

      {
        name = "vscode-language-babel";
        publisher = "mgmcdermott";
        version = "0.0.20";
        sha256 = "0zvhq0ripvz2x68pfzmqgvp5rz5ydr6rvzxgda849rg9jhkk34ri";
      }

      {
        name = "vscode-filesize";
        publisher = "mkxml";
        version = "2.1.1";
        sha256 = "03sywm0pi777syy1k4a76wpiqaky8mk7asr4wnq9fd71327481wn";
      }

      {
        name = "azure-account";
        publisher = "ms-vscode";
        version = "0.4.3";
        sha256 = "149cc99a2502svi55zpfmngl3dsw7kji45vsgpzwh6559szzd2fq";
      }

      {
        name = "csharp";
        publisher = "ms-vscode";
        version = "1.16.1";
        sha256 = "1pjhdz8i434qz05aj55qrflfvd14n2ig9dk242jcf8is5gqv405d";
      }

      {
        name = "vs-keybindings";
        publisher = "ms-vscode";
        version = "0.2.0";
        sha256 = "176xvqcaf3ls5sa1ldb0iyv6hi5d6fmcam1a3gkdk6m5na6vfca8";
      }

      {
        name = "vsliveshare";
        publisher = "ms-vsliveshare";
        version = "0.3.735";
        sha256 = "1as4sxv6jsyydkninc8z0k743qh11m38ryfxlf5aw5bh79qc28fl";
      }

      {
        name = "debugger-for-chrome";
        publisher = "msjsdiag";
        version = "4.10.2";
        sha256 = "00lnxbdsb24jl4dblwavshwkpn72n95fgh2x58fnmf5hfr7h6jx8";
      }

      {
        name = "vscode-docker";
        publisher = "PeterJausovec";
        version = "0.3.1";
        sha256 = "13rkgc45vk25nphnkjdqrjm1zy32s2v54ycy9vm6kvi9na71fl7d";
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
        version = "0.20.0";
        sha256 = "09p9vc45nq542vlrb6wn5958gmv7dy600i5nxgam78m08k5il2dd";
      }

      {
        name = "java";
        publisher = "redhat";
        version = "0.32.0";
        sha256 = "0agwvwrjzfv2fnkfpgybzgalq5skbj8smxpbjh44ys8187p0j2wq";
      }

      {
        name = "rust";
        publisher = "rust-lang";
        version = "0.4.10";
        sha256 = "1y7sb3585knv2pbq7vf2cjf3xy1fgzrqzn2h3fx2d2bj6ns6vpy3";
      }

      {
        name = "code-settings-sync";
        publisher = "Shan";
        version = "3.1.2";
        sha256 = "1rf35fbh4j5z6bwkln3cxfi21yqqmv79vnq7a51mk1r4p1c8rhai";
      }

      {
        name = "stylelint";
        publisher = "shinnn";
        version = "0.43.0";
        sha256 = "0inp8mp6mz61gyamc5ribxq7jfq9wcslxxddhpv2si23vidani7b";
      }

      {
        name = "shader";
        publisher = "slevesque";
        version = "1.1.3";
        sha256 = "16142iq2x28zyrclbbr0p99g7kivyk6cwcg0d5cmrwjfcvv3liiy";
      }

      {
        name = "cmake";
        publisher = "twxs";
        version = "0.0.17";
        sha256 = "11hzjd0gxkq37689rrr2aszxng5l9fwpgs9nnglq3zhfa1msyn08";
      }

      {
        name = "vscode-java-debug";
        publisher = "vscjava";
        version = "0.13.0";
        sha256 = "11xvd1b0qsvrbm4yb0c7fm537p1gs6wz45xzl6v1a7k08dapi20i";
      }

      {
        name = "vscode-java-pack";
        publisher = "vscjava";
        version = "0.4.0";
        sha256 = "1fsayy5yyarasg0w0sgd9ak6vb25m38mr09cj1vjzmmpdac0mg2q";
      }

      {
        name = "vscode-java-test";
        publisher = "vscjava";
        version = "0.9.0";
        sha256 = "0000v5qh100n3n529r1nzx79cawx83kvprrmhw6pb4j0m5b3p3p2";
      }

      {
        name = "vscode-maven";
        publisher = "vscjava";
        version = "0.11.0";
        sha256 = "031ys6ka7wii36s3r0mlrfl1n01kv8s871gb4g7phq7z90xlp697";
      }
    ];
  };
}
