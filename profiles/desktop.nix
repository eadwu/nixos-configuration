{ options, config, pkgs, lib, ... }:

with config.nixos; {
  imports =
    [
      ./default.nix

      ../modules/audio.nix
      ../modules/backlight
      ../modules/clight.nix
      ../modules/picom.nix
      ../modules/cups.nix
      # ../modules/emacs.nix
      ../modules/i3color.nix
      ../modules/logind
      ../modules/lorri.nix
      # ../modules/monitoring
      ../modules/network
      # ../modules/oomd.nix
      ../modules/tlp.nix
      ../modules/users.nix
      ../modules/virtualisation.nix
      ../modules/watchman.nix
      ../modules/zsh.nix
    ];

  # boot.kernelPackages = lib.mkOverride (-1000) pkgs.linuxPackages_latest;

  boot.supportedFilesystems = [ "ntfs" ];

  boot.tmp = {
    cleanOnBoot = true;
    useTmpfs = true;
  };

  environment = {
    pathsToLink = [
      "share/hunspell"
      "share/myspell/dicts"
    ];

    systemPackages = with pkgs; [
      feh
      nnn
      pywal
      xclip
      # Version Control
      hub
      git-filter-repo
      git-lfs
      # Languages / SDKs
      gcc
      gdb
      go
      # julia-stable-bin
      llvmPackages.clang
      # mongodb
      mariadb
      nasm
      nodejs
      corepack
      openjdk
      python3
      multimarkdown
      # rWrapper
      R
      sass
      sbt
      scala
      sqlite
      texlive.combined.scheme-full
      ## Go
      # delve
      golint
      gopls
      gopkgs
      go-outline
      go-tools
      ## Haskell
      stack
      ## Lean
      lean
      mathlibtools
      elan
      ## Rust
      cargo-edit
      (with fenix; combine [
        stable.toolchain
        targets.aarch64-unknown-linux-gnu.stable.rust-std
        targets.x86_64-apple-darwin.stable.rust-std
        targets.x86_64-pc-windows-gnu.stable.rust-std
        targets.x86_64-pc-windows-msvc.stable.rust-std
        targets.x86_64-unknown-linux-gnu.stable.rust-std
        targets.aarch64-apple-darwin.stable.rust-std
        targets.x86_64-unknown-linux-musl.stable.rust-std
        targets.wasm32-unknown-emscripten.stable.rust-std
        targets.wasm32-unknown-unknown.stable.rust-std
        targets.wasm32-wasi.stable.rust-std
      ])
      rust-analyzer
      ## Zig
      zls
      # zig
      # zigpkgs.latest
      # Build Tools
      bazel
      bazel-buildtools
      cmake
      gnumake
      # Misc
      archiver
      binutils-unwrapped
      cachix
      cpuset
      epubcheck
      ffmpeg
      gnupg
      hunspell
      hunspellDicts.en_US
      hunspellDicts.en_US-large
      imagemagick
      nix-diff
      rofi
      scrot
      st
      wakatime
      wget2
      xorg.xsetroot
    ];

    variables = {
      JAVA_HOME = "${pkgs.openjdk}/lib/openjdk";
      DOCKER_ID_USER = settings.docker.user;
      RUST_SRC_PATH = pkgs.fenix.complete.rust-src + "/lib/rustlib/src/rust/library";
      LIBCLANG_PATH = "${pkgs.llvmPackages.libclang.lib}/lib";
      NIX_HARDENING_ENABLE = "";
    };
  };

  fonts.fontDir.enable = true;
  fonts.enableGhostscriptFonts = true;
  fonts.fontconfig.defaultFonts =
    {
      monospace = [ "Liberation Mono" ];
      sansSerif = [ "Liberation Sans" ];
      serif = [ "Liberation Serif" ];
      emoji = [ "Unifont" ] ++ options.fonts.fontconfig.defaultFonts.emoji.default;
    };
  fonts.packages = with pkgs;
    [
      anonymousPro
      eb-garamond
      cascadia-code
      comfortaa
      corefonts
      font-awesome_6
      font-awesome_5
      ibm-plex
      lato
      liberation_ttf
      nerdfonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      recursive
      unifont
      weather-icons

      intel-one-mono

      comic-mono
      ludusavi
      material-icons
      material-design-icons
    ];

  programs.dconf.enable = true;

  programs.gnupg.agent.enable = true;
  # programs.gnupg.agent.pinentryFlavor = "qt";
  programs.gnupg.agent.pinentryPackage = pkgs.pinentry-all;

  # services.gnome.gnome-keyring.enable = true;

  programs.zsh = {
    interactiveShellInit = let
      commands = {
        nix-generate-iso = "isoImage";
        nix-generate-sd = "sdImage";
        nix-cross-compile-sd = "crossSdImage";
        nix-generate-vm = "ovaImage";
      };
    in lib.concatMapStringsSep "\n" (cmd: ''
      ${cmd} () {
        local flakePath="${./..}"

        if [ ! -z "$1" ]; then
          flakePath="$1"
          shift
        fi

        nix build "$@" "$flakePath#${commands.${cmd}}"
      }
    '') (builtins.attrNames commands);
  };
}
