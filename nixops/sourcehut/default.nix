{
  network.description = "sr.ht network";

  git = { ... }: {
    imports = [ ./git.nix ];
    services.sourcehut.settings = {
      "git.sr.ht".oauth-client-id = "";
      "git.sr.ht".oauth-client-secret = "";

      # Optional builds.sr.ht integration
      # "builds.sr.ht".origin = "http://buildsrht.local";
      # "builds.sr.ht".oauth-client-id = "CHANGEME";
    };
  };

  hg = { ... }: {
    imports = [ ./hg.nix ];
    services.sourcehut.settings = {
      "hg.sr.ht".oauth-client-id = "";
      "hg.sr.ht".oauth-client-secret = "";
    };
  };

  man = { ... }: {
    imports = [ ./man.nix ];
    services.sourcehut.settings = {
      "man.sr.ht".oauth-client-id = "";
      "man.sr.ht".oauth-client-secret = "";

      "git.sr.ht".oauth-client-id = "";
    };
  };

  paste = { ... }: {
    imports = [ ./paste.nix ];
    services.sourcehut.settings = {
      "paste.sr.ht".oauth-client-id = "";
      "paste.sr.ht".oauth-client-secret = "";
    };
  };

  todo = { ... }: {
    imports = [ ./todo.nix ];
    services.sourcehut.settings = {
      "todo.sr.ht".oauth-client-id = "";
      "todo.sr.ht".oauth-client-secret = "";
    };
  };

  meta = { ... }: {
    imports = [ ./meta.nix ];
    services.sourcehut.settings = {
      # After setting up meta.sr.ht and registering yourself a user account, you can give that account admin permissions:
      # $ python3
      # from metasrht.app import db, User, UserType
      # u = User.query.filter_by(username='[your username]').one()
      # u.user_type = UserType.admin
      # User.query.session.commit()
      "meta.sr.ht::settings".registration = "yes";

      # Specify OAuth keys for other services here
    };
  };

  defaults = { config, pkgs, ... }: {
    imports = [ ../machines/libvirtd.nix ];

    deployment.libvirtd = {
      memorySize = 512;
      baseImageSize = 4;
    };

    networking.firewall.allowedTCPPorts = [ 80 443 ];

    services.nginx = {
      enable = true;
      recommendedTlsSettings = true;
      recommendedOptimisation = true;
      recommendedGzipSettings = true;
      recommendedProxySettings = true;
    };

    services.sourcehut.enable = true;
    services.sourcehut.settings = {
      "sr.ht".site-name = "sourcehut";
      "sr.ht".site-info = config.services.sourcehut.settings."meta.sr.ht".origin;
      "sr.ht".site-blurb = "\"the hacker's forge\"";
      "sr.ht".environment = "production";
      "sr.ht".owner-name = "Edmund Wu";
      "sr.ht".owner-email = "";
      # nix-shell -p pwgen --run 'pwgen 32'
      "sr.ht".secret-key = "";
      webhooks.private-key = "";

      "git.sr.ht".origin = "";
      "hg.sr.ht".origin = "";
      "man.sr.ht".origin = "";
      "paste.sr.ht".origin = "";
      "todo.sr.ht".origin = "";
      "meta.sr.ht".origin = "";
    };
  };
}
