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
      ../modules/emacs.nix
      ../modules/i3color.nix
      ../modules/logind
      ../modules/lorri.nix
      ../modules/monitoring
      ../modules/network
      ../modules/oomd.nix
      ../modules/tlp.nix
      ../modules/users.nix
      ../modules/virtualisation.nix
      ../modules/watchman.nix
      ../modules/xserver
      ../modules/zsh.nix
    ];

  boot = {
    cleanTmpDir = true;
    supportedFilesystems = [ "ntfs" ];
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
      julia-stable-bin
      llvmPackages.clang-unwrapped
      mongodb
      mariadb
      nasm
      nodejs
      openjdk
      python3
      multimarkdown
      rWrapper
      sass
      sbt
      scala
      sqlite
      texlive.combined.scheme-full
      ## Go
      delve
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
      (with fenix; combine [
        complete.toolchain
        targets.aarch64-unknown-linux-gnu.latest.rust-std
        targets.x86_64-apple-darwin.latest.rust-std
        targets.x86_64-pc-windows-gnu.latest.rust-std
        targets.x86_64-pc-windows-msvc.latest.rust-std
        targets.x86_64-unknown-linux-gnu.latest.rust-std
        targets.aarch64-apple-darwin.latest.rust-std
        targets.x86_64-unknown-linux-musl.latest.rust-std
        targets.wasm32-unknown-emscripten.latest.rust-std
        targets.wasm32-unknown-unknown.latest.rust-std
        targets.wasm32-wasi.latest.rust-std
      ])
      rust-analyzer
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
      xorg.xsetroot
    ];

    variables = {
      DOCKER_ID_USER = settings.docker.user;
      RUST_SRC_PATH = pkgs.fenix.complete.rust-src + "/lib/rustlib/src/rust/library";
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
  fonts.fonts = with pkgs;
    [
      anonymousPro
      eb-garamond
      cascadia-code
      comfortaa
      corefonts
      font-awesome_5
      ibm-plex
      lato
      liberation_ttf
      noto-fonts-cjk
      recursive
      unifont
      weather-icons
    ];

  programs.dconf.enable = true;

  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "qt";
  };

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
