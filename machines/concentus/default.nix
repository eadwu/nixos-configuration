{ options, config, pkgs, lib, modulesPath, ... }:

{
  imports =
    [
      ../../configurations/wsl
    ];

  wsl.defaultUser = "concentus";
  networking.hostName = config.wsl.defaultUser;

  time.timeZone = "America/Los_Angeles";

  networking.firewall.allowedTCPPorts = [ 8554 8322 ];

  services.openssh.ports = [ 26 ];

  # As of 820ba067f2dc2d276b124aa2a16b3c4380310367
  services.rtsp-simple-server.enable = true;
  # services.rtsp-simple-server.settings = {
  #   # General parameters
  #   logLevel = "info";
  #   logDestinations = "[stdout]";

  #   readBufferCount = 1024;

  #   api = "no";

  #   metrics = "no";
  #   # metrics = "yes";
  #   # metricsAddress = "127.0.0.1:9998";

  #   # RTSP parameters
  #   # Disable support for the RTSP protocol.
  #   rtspDisable = "no";
  #   # List of enabled RTSP transport protocols.
  #   # UDP is the most performant, but doesn't work when there's a NAT/firewall between
  #   # server and clients, and doesn't support encryption.
  #   # UDP-multicast allows to save bandwidth when clients are all in the same LAN.
  #   # TCP is the most versatile, and does support encryption.
  #   # The handshake is always performed with TCP.
  #   protocols = "[tcp]";
  #   # Encrypt handshakes and TCP streams with TLS (RTSPS).
  #   # Available values are "no", "strict", "optional".
  #   encryption = "no";
  #   # Address of the TCP/RTSP listener. This is needed only when encryption is "no" or "optional".
  #   rtspAddress = ":8554";
  #   # Address of the TCP/TLS/RTSPS listener. This is needed only when encryption is "strict" or "optional".
  #   rtspsAddress = ":8322";
  #   # Path to the server key. This is needed only when encryption is "strict" or "optional".
  #   # This can be generated with:
  #   # openssl genrsa -out server.key 2048
  #   # openssl req -new -x509 -sha256 -key server.key -out server.crt -days 3650
  #   # serverKey: server.key
  #   # Path to the server certificate. This is needed only when encryption is "strict" or "optional".
  #   # serverCert: server.crt
  #   # Authentication methods.
  #   authMethods = "[basic, digest]";

  #   rtmpDisable = "yes";

  #   hlsDisable = "yes";
  # };

  environment.etc."rtsp-simple-server.yaml".source = lib.mkForce (pkgs.writeText "rtsp-simple-server.yaml" ''
    ###############################################
    # General parameters

    # Sets the verbosity of the program; available values are "error", "warn", "info", "debug".
    logLevel: info
    # Destinations of log messages; available values are "stdout", "file" and "syslog".
    logDestinations: [stdout]
    # If "file" is in logDestinations, this is the file which will receive the logs.
    logFile: rtsp-simple-server.log

    # Timeout of read operations.
    readTimeout: 10s
    # Timeout of write operations.
    writeTimeout: 10s
    # Number of read buffers.
    # A higher number allows a wider throughput, a lower number allows to save RAM.
    readBufferCount: 1024

    # HTTP URL to perform external authentication.
    # Every time a user wants to authenticate, the server calls this URL
    # with the POST method and a body containing:
    # {
    #   "ip": "ip",
    #   "user": "user",
    #   "password": "password",
    #   "path": "path",
    #   "action": "read|publish"
    #   "query": "url's raw query"
    # }
    # If the response code is 20x, authentication is accepted, otherwise
    # it is discarded.
    externalAuthenticationURL:

    # Enable the HTTP API.
    api: no
    # Address of the API listener.
    apiAddress: 127.0.0.1:9997

    # Enable Prometheus-compatible metrics.
    metrics: no
    # Address of the metrics listener.
    metricsAddress: 127.0.0.1:9998

    # Enable pprof-compatible endpoint to monitor performances.
    pprof: no
    # Address of the pprof listener.
    pprofAddress: 127.0.0.1:9999

    # Command to run when a client connects to the server.
    # This is terminated with SIGINT when a client disconnects from the server.
    # The following environment variables are available:
    # * RTSP_PORT: server port
    runOnConnect:
    # Restart the command if it exits suddenly.
    runOnConnectRestart: no

    ###############################################
    # RTSP parameters

    # Disable support for the RTSP protocol.
    rtspDisable: no
    # List of enabled RTSP transport protocols.
    # UDP is the most performant, but doesn't work when there's a NAT/firewall between
    # server and clients, and doesn't support encryption.
    # UDP-multicast allows to save bandwidth when clients are all in the same LAN.
    # TCP is the most versatile, and does support encryption.
    # The handshake is always performed with TCP.
    protocols: [udp, multicast, tcp]
    # Encrypt handshakes and TCP streams with TLS (RTSPS).
    # Available values are "no", "strict", "optional".
    encryption: "no"
    # Address of the TCP/RTSP listener. This is needed only when encryption is "no" or "optional".
    rtspAddress: 127.0.0.1:8554
    # Address of the TCP/TLS/RTSPS listener. This is needed only when encryption is "strict" or "optional".
    rtspsAddress: 127.0.0.1:8322
    # Address of the UDP/RTP listener. This is needed only when "udp" is in protocols.
    rtpAddress: :8000
    # Address of the UDP/RTCP listener. This is needed only when "udp" is in protocols.
    rtcpAddress: :8001
    # IP range of all UDP-multicast listeners. This is needed only when "multicast" is in protocols.
    multicastIPRange: 224.1.0.0/16
    # Port of all UDP-multicast/RTP listeners. This is needed only when "multicast" is in protocols.
    multicastRTPPort: 8002
    # Port of all UDP-multicast/RTCP listeners. This is needed only when "multicast" is in protocols.
    multicastRTCPPort: 8003
    # Path to the server key. This is needed only when encryption is "strict" or "optional".
    # This can be generated with:
    # openssl genrsa -out server.key 2048
    # openssl req -new -x509 -sha256 -key server.key -out server.crt -days 3650
    serverKey: server.key
    # Path to the server certificate. This is needed only when encryption is "strict" or "optional".
    serverCert: server.crt
    # Authentication methods.
    authMethods: [basic, digest]

    ###############################################
    # RTMP parameters

    # Disable support for the RTMP protocol.
    rtmpDisable: yes
    # Address of the RTMP listener. This is needed only when encryption is "no" or "optional".
    rtmpAddress: :1935
    # Encrypt connections with TLS (RTMPS).
    # Available values are "no", "strict", "optional".
    rtmpEncryption: "no"
    # Address of the RTMPS listener. This is needed only when encryption is "strict" or "optional".
    rtmpsAddress: :1936
    # Path to the server key. This is needed only when encryption is "strict" or "optional".
    # This can be generated with:
    # openssl genrsa -out server.key 2048
    # openssl req -new -x509 -sha256 -key server.key -out server.crt -days 3650
    rtmpServerKey: server.key
    # Path to the server certificate. This is needed only when encryption is "strict" or "optional".
    rtmpServerCert: server.crt

    ###############################################
    # HLS parameters

    # Disable support for the HLS protocol.
    hlsDisable: yes
    # Address of the HLS listener.
    hlsAddress: :8888
    # By default, HLS is generated only when requested by a user.
    # This option allows to generate it always, avoiding the delay between request and generation.
    hlsAlwaysRemux: no
    # Variant of the HLS protocol to use. Available options are:
    # * mpegts - uses MPEG-TS segments, for maximum compatibility.
    # * fmp4 - uses fragmented MP4 segments, more efficient.
    # * lowLatency - uses Low-Latency HLS.
    hlsVariant: mpegts
    # Number of HLS segments to keep on the server.
    # Segments allow to seek through the stream.
    # Their number doesn't influence latency.
    hlsSegmentCount: 7
    # Minimum duration of each segment.
    # A player usually puts 3 segments in a buffer before reproducing the stream.
    # The final segment duration is also influenced by the interval between IDR frames,
    # since the server changes the duration in order to include at least one IDR frame
    # in each segment.
    hlsSegmentDuration: 1s
    # Minimum duration of each part.
    # A player usually puts 3 parts in a buffer before reproducing the stream.
    # Parts are used in Low-Latency HLS in place of segments.
    # Part duration is influenced by the distance between video/audio samples
    # and is adjusted in order to produce segments with a similar duration.
    hlsPartDuration: 200ms
    # Maximum size of each segment.
    # This prevents RAM exhaustion.
    hlsSegmentMaxSize: 50M
    # Value of the Access-Control-Allow-Origin header provided in every HTTP response.
    # This allows to play the HLS stream from an external website.
    hlsAllowOrigin: '*'
    # Enable TLS/HTTPS on the HLS server.
    # This is required for Low-Latency HLS.
    hlsEncryption: no
    # Path to the server key. This is needed only when encryption is yes.
    # This can be generated with:
    # openssl genrsa -out server.key 2048
    # openssl req -new -x509 -sha256 -key server.key -out server.crt -days 3650
    hlsServerKey: server.key
    # Path to the server certificate.
    hlsServerCert: server.crt
    # List of IPs or CIDRs of proxies behind the HLS server.
    # If the server receives a request from one of these entries, IP in logs
    # will be taken from the X-Forwarded-For header.
    hlsTrustedProxies: []

    ###############################################
    # Path parameters

    # These settings are path-dependent, and the map key is the name of the path.
    # It's possible to use regular expressions by using a tilde as prefix.
    # For example, "~^(test1|test2)$" will match both "test1" and "test2".
    # For example, "~^prefix" will match all paths that start with "prefix".
    # The settings under the path "all" are applied to all paths that do not match
    # another entry.
    paths:
      all:
        # Source of the stream. This can be:
        # * publisher -> the stream is published by a RTSP or RTMP client
        # * rtsp://existing-url -> the stream is pulled from another RTSP server / camera
        # * rtsps://existing-url -> the stream is pulled from another RTSP server / camera with RTSPS
        # * rtmp://existing-url -> the stream is pulled from another RTMP server / camera
        # * rtmps://existing-url -> the stream is pulled from another RTMP server / camera with RTMPS
        # * http://existing-url/stream.m3u8 -> the stream is pulled from another HLS server
        # * https://existing-url/stream.m3u8 -> the stream is pulled from another HLS server with HTTPS
        # * redirect -> the stream is provided by another path or server
        # * rpiCamera -> the stream is provided by a Raspberry Pi Camera
        source: publisher

        # If the source is an RTSP or RTSPS URL, this is the protocol that will be used to
        # pull the stream. available values are "automatic", "udp", "multicast", "tcp".
        sourceProtocol: automatic

        # If the source is an RTSP or RTSPS URL, this allows to support sources that
        # don't provide server ports or use random server ports. This is a security issue
        # and must be used only when interacting with sources that require it.
        sourceAnyPortEnable: no

        # If the source is a RTSPS, RTMPS or HTTPS URL, and the source certificate is self-signed
        # or invalid, you can provide the fingerprint of the certificate in order to
        # validate it anyway. It can be obtained by running:
        # openssl s_client -connect source_ip:source_port </dev/null 2>/dev/null | sed -n '/BEGIN/,/END/p' > server.crt
        # openssl x509 -in server.crt -noout -fingerprint -sha256 | cut -d "=" -f2 | tr -d ':'
        sourceFingerprint:

        # If the source is an RTSP or RTMP URL, it will be pulled only when at least
        # one reader is connected, saving bandwidth.
        sourceOnDemand: no
        # If sourceOnDemand is "yes", readers will be put on hold until the source is
        # ready or until this amount of time has passed.
        sourceOnDemandStartTimeout: 10s
        # If sourceOnDemand is "yes", the source will be closed when there are no
        # readers connected and this amount of time has passed.
        sourceOnDemandCloseAfter: 10s

        # If the source is "redirect", this is the RTSP URL which clients will be
        # redirected to.
        sourceRedirect:

        # If the source is "publisher" and a client is publishing, do not allow another
        # client to disconnect the former and publish in its place.
        disablePublisherOverride: no

        # If the source is "publisher" and no one is publishing, redirect readers to this
        # path. It can be can be a relative path  (i.e. /otherstream) or an absolute RTSP URL.
        fallback:

        # If the source is "rpiCamera", these are the Raspberry Pi Camera parameters
        rpiCameraCamID: 0
        rpiCameraWidth: 1280
        rpiCameraHeight: 720
        rpiCameraFPS: 30
        rpiCameraIDRPeriod: 60
        rpiCameraBitrate: 1000000
        rpiCameraProfile: main
        rpiCameraLevel: '4.1'

        # Username required to publish.
        # SHA256-hashed values can be inserted with the "sha256:" prefix.
        publishUser:
        # Password required to publish.
        # SHA256-hashed values can be inserted with the "sha256:" prefix.
        publishPass:
        # IPs or networks (x.x.x.x/24) allowed to publish.
        publishIPs: []

        # Username required to read.
        # SHA256-hashed values can be inserted with the "sha256:" prefix.
        readUser:
        # password required to read.
        # SHA256-hashed values can be inserted with the "sha256:" prefix.
        readPass:
        # IPs or networks (x.x.x.x/24) allowed to read.
        readIPs: []

        # Command to run when this path is initialized.
        # This can be used to publish a stream and keep it always opened.
        # This is terminated with SIGINT when the program closes.
        # The following environment variables are available:
        # * RTSP_PATH: path name
        # * RTSP_PORT: server port
        # * G1, G2, ...: regular expression groups, if path name is
        #   a regular expression.
        runOnInit:
        # Restart the command if it exits suddenly.
        runOnInitRestart: no

        # Command to run when this path is requested.
        # This can be used to publish a stream on demand.
        # This is terminated with SIGINT when the path is not requested anymore.
        # The following environment variables are available:
        # * RTSP_PATH: path name
        # * RTSP_PORT: server port
        # * G1, G2, ...: regular expression groups, if path name is
        #   a regular expression.
        runOnDemand:
        # Restart the command if it exits suddenly.
        runOnDemandRestart: no
        # Readers will be put on hold until the runOnDemand command starts publishing
        # or until this amount of time has passed.
        runOnDemandStartTimeout: 10s
        # The command will be closed when there are no
        # readers connected and this amount of time has passed.
        runOnDemandCloseAfter: 10s

        # Command to run when the stream is ready to be read, whether it is
        # published by a client or pulled from a server / camera.
        # This is terminated with SIGINT when the stream is not ready anymore.
        # The following environment variables are available:
        # * RTSP_PATH: path name
        # * RTSP_PORT: server port
        # * G1, G2, ...: regular expression groups, if path name is
        #   a regular expression.
        runOnReady:
        # Restart the command if it exits suddenly.
        runOnReadyRestart: no

        # Command to run when a clients starts reading.
        # This is terminated with SIGINT when a client stops reading.
        # The following environment variables are available:
        # * RTSP_PATH: path name
        # * RTSP_PORT: server port
        # * G1, G2, ...: regular expression groups, if path name is
        #   a regular expression.
        runOnRead:
        # Restart the command if it exits suddenly.
        runOnReadRestart: no
  '');
}
