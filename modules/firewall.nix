{ ... }:

{
  networking.blacklistHosts = [
    # If you're part of an organization who wants to control access to Remote Tunnels,
    # you can do so by allowing or denying access to the domain global.rel.tunnels.api.visualstudio.com.
    # *.tunnels.api.visualstudio.com
    # *.devtunnels.ms
    "global.rel.tunnels.api.visualstudio.com"
    "devtunnels.ms"
    "tunnels.api.visualstudio.com"

    # https://www.ory.sh/docs/ecosystem/sqa
    "sqa.ory.sh"

    # how about no thanks
    "services.f-ck.me"
    "wsrv.nl"
  ];

  networking.whitelist = [
    # Invalid domains
    "^[^.]*$" # if there isn't any dots, it probably isn't a domain
    "[^0-9A-Za-z\-\.]" # any invalid character for domain anywhere
    "^\-" # no hyphen at beginning
    "\-$" # no hyphen at end

    # Open Telemetry Helm Charts
    "^open-telemetry.github.io$"

    # https://github.com/hagezi/dns-blocklists/blob/main/share/facebook.txt
    # Facebook/Messenger App Android/iOS (Comments, Messages)
    "^b-graph-fallback.facebook.com$"
    "^b-graph.facebook.com$"
    "^graph-fallback.facebook.com$"
    "^graph.facebook.com$"
    "^graph.fbpigeon.com$"
    "^z-m-graph.facebook.com$"

    # Other Facebook functions, unblocking may not be needed
    "^connect.facebook.com$"
    "^connect.facebook.net$"
    "^mqtt-mini.facebook.com$"
    "^web.facebook.com$"

    # NVIDIA Store
    "^api.nvidia.partners$"

    # MangaUpdate
    "^www.mangaupdates.com$"

    # Crunchyroll download
    "^fy.v.vrv.co$"
    # DNS Resolution service for above
    "^ellation.map.fastly.net$"

    "^clickhouse.com$" # ClickHouse DB
    "^www.clickhouse.com$" # ClickHouse DB
    "^www.rarlab.com$" # RAR archiver source...
    "^stats.stackexchange.com$" # stackexchange...
    "^tags.tiqcdn.com$" # weather.com
    "^lists.gnu.org$" # GNU...
    "^[^.]*.googlevideo.com$" # Youtube providers
    "(^boards.|^)4chan.org$" # need anything be said...

    # weather.com videos
    "^v.w-x.co$"
    # UB Box, buffalo.app.box.com
    "^app.box.com$"
    # Akuna Capital
    "^greenhouse.io$"
    "^boards.greenhouse.io$"
    # Wattpad
    "^www.wattpad.com$"
    # yeet
    "^files.catbox.moe$"
    # "^groups.csail.mit.edu$"
    "^aditsachde.com$"
    "^.*.mathworks.com.*$"
    # Imgur
    "^t.imgur.com$"

    "^.*.homedepot.com.*$"
    "^www.lemonade.com$"
    "^.*.alaskaair.com.*$"

    # Job Applications
    "^account.amazon.jobs$"
    "^qualtrics.com$"
    "^salesforce.com$"
    "^uhf.microsoft.com$"
    "^careers.tiktok.com$"
  ];
}
