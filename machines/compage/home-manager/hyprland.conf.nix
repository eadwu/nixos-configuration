{ pkgs, ... }:

''
  # This is an example Hyprland config file.
  #
  # Refer to the wiki for more information.

  #
  # Please note not all available settings / options are set here.
  # For a full list, see the wiki
  #

  # See https://wiki.hyprland.org/Configuring/Monitors/
  monitor=,highres,0x0,1.6
  # monitor=,2256x1504@60,0x0,1.6
  # monitor=,1920x1080@60,0x0,1
  # monitor=,highres,auto,1,mirror,X11-1
  # monitor=,preferred,auto,auto

  env = GDK_DPI_SCALE, 1.5
  # Doubles scale with GDK_DPI_SCALE
  env = MOZ_ENABLE_WAYLAND, 0

  xwayland {
    force_zero_scaling = true
  }

  # See https://wiki.hyprland.org/Configuring/Keywords/ for more

  # Execute your favorite apps at launch
  # exec-once = ${pkgs.eww}/bin/eww --restart open-many side-bar
  exec = ${pkgs.eww}/bin/eww --restart --config ~/Projects/nixos-configuration/machines/compage/home-manager/eww open-many side-bar

  # Source a file (multi-file configs)
  # source = ~/.config/hypr/myColors.conf

  # Some default env vars.
  # env = GBM_BACKEND, nvidia-drm
  # env = __GLX_VENDOR_LIBRARY_NAME, nvidia
  # env = __EGL_VENDOR_LIBRARY_FILENAMES, /etc/egl/egl_external_platform.d/15_nvidia_gbm.json

  env = XDG_CURRENT_DESKTOP, Hyprland
  env = XDG_SESSION_TYPE, wayland
  env = XDG_SESSION_DESKTOP, Hyprland

  env = QT_AUTO_SCREEN_SCALE_FACTOR, 1
  env = QT_WAYLAND_DISABLE_WINDOWDECORATION, 1
  env = QT_QPA_PLATFORMTHEME, qt5ct

  # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
  input {
    kb_layout = us
    kb_variant =
    kb_model =
    kb_options =
    kb_rules =

    repeat_delay = 400
    repeat_rate = 32
    sensitivity = 0.0 # -1.0 - 1.0, 0 means no modification.

    follow_mouse = 1

    touchpad {
      natural_scroll = false
    }
  }

  general {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    gaps_in = 0
    gaps_out = 0
    border_size = 0
    col.active_border = rgb(526980)
    col.inactive_border = rgb(14191f)
    # col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
    # col.inactive_border = rgba(595959aa)

    layout = dwindle

    # disable_hyprland_logo true
    # disable_splash_rendering true
  }

  decoration {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    rounding = 10
    # blur = true
    # blur_size = 3
    # blur_passes = 1
    # blur_new_optimizations = true

    # Change transparency of focused and unfocused windows
    # active_opacity = 0.85
    # inactive_opacity = 0.8

    drop_shadow = true
    shadow_range = 4
    shadow_render_power = 3
    col.shadow = rgba(1a1a1aee)
  }

  animations {
    enabled = true

    # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

    bezier = myBezier, 0.05, 0.9, 0.1, 1.05

    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = border, 1, 10, default
    animation = borderangle, 1, 8, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, default
  }

  dwindle {
    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    # pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = true # you probably want this
    no_gaps_when_only = true
  }

  master {
    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    # new_is_master = true
    no_gaps_when_only = true
    inherit_fullscreen = true # monocle-ish hack
  }

  gestures {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    workspace_swipe = false
  }

  # Example per-device config
  # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
  # device:epic-mouse-v1 {
  #   sensitivity = -0.5
  # }

  # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

  # Tile everything by default
  # windowrule = tile, .*

  windowrulev2 = workspace 1, class:^Vivaldi-stable$
  windowrulev2 = workspace 1, class:^Vivaldi-snapshot$
  windowrulev2 = workspace 1, class:^vivaldi-snapshot$
  # windowrulev2 = workspace 2, class:^Code$
  # windowrulev2 = workspace 2, class:^Code - Insiders$
  windowrulev2 = workspace 2, title:^Visual Studio Code - Insiders$
  windowrulev2 = workspace 2, class:^Emacs$
  windowrulev2 = workspace 2, class:^.emacs-wrapped$
  windowrulev2 = workspace 2, class:^jetbrains-idea$
  windowrulev2 = workspace 2, class:^jetbrains-idea-ce$
  windowrulev2 = workspace 2, class:^Blender$
  windowrulev2 = workspace 4, class:^discord$
  windowrulev2 = workspace 4, class:^Element$
  windowrulev2 = workspace 5, class:^Mail$
  windowrulev2 = workspace 5, class:^Thunderbird$
  windowrulev2 = workspace 5, class:^thunderbird$
  windowrulev2 = workspace 6, class:^Slack$
  windowrulev2 = float, title:^GLava$
  windowrulev2 = float, title:^Notejot$
  windowrulev2 = float, class:^Zenity$
  windowrulev2 = float, class:^Nitrogen$
  windowrulev2 = float, class:^Pinentry$
  windowrulev2 = float, class:^pinentry$
  windowrulev2 = float, class:^Xfce4-screenshooter$
  windowrulev2 = float, class:^Oblogout$

  windowrulev2 = tile, class:^vivaldi-snapshot$
  windowrulev2 = opacity 1.0, class:^vivaldi-snapshot$
  windowrulev2 = opacity 1.0, class:^Vivaldi-snapshot$
  windowrulev2 = opacity 1.0, class:^com.moonlight_stream.Moonlight$
  windowrulev2 = opacity 1.0, title:^Moonlight$


  # See https://wiki.hyprland.org/Configuring/Keywords/ for more
  # SHIFT CAPS CTRL/CONTROL ALT MOD2 MOD3 SUPER/WIN/LOGO/MOD4 MOD5
  $mainMod = ALT

  # Launch a terminal
  bind = $mainMod, grave, exec, kitty

  # Close focused window
  binde = $mainMod SHIFT, Q, killactive,

  # Rotate through the available layout algorithms

  # Reset the layouts on the current workspace to default (monocle-ish)
  bind = $mainMod SHIFT, space, exec, hyprctl dispatch fullscreen 1
  bind = $mainMod SHIFT, space, exec, togglegroup

  # Move focus to the next window
  binde = $mainMod, L, cyclenext,
  binde = $mainMod, L, changegroupactive, f

  # Move focus to the previous window
  binde = $mainMod, H, cyclenext, prev
  binde = $mainMod, H, changegroupactive, b

  # Swap the focused window with the next window
  binde = $mainMod SHIFT, L, swapnext,

  # Swap the focused window with the previous window
  binde = $mainMod SHIFT, H, swapnext, prev

  # Push window back into tiling
  bind = $mainMod, S, togglefloating, active

  # Toggle the status bar gap

  # Quit hyprland
  bind = $mainMod SHIFT, XF86PowerOff, exit,

  # Restart hyprland and eww components
  bind = $mainMod, Escape, exec, hyprctl reload
  # bind = $mainMod, Escape, exec, eww reload
  bind = $mainMod, Escape, exec, eww reload --restart --config ~/Projects/nixos-configuration/home-manager/eww

  # Logout screen
  bind = , XF86PowerOff, exec, pkill -KILL -u $USER

  # Volume
  bind = , XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle
  binde = , XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -2%
  binde = , XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +2%
  binde = SHIFT, XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -1%
  binde = SHIFT, XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +1%

  # Monitor backlight
  binde = , XF86MonBrightnessDown, exec, sudo mon_backlight -
  binde = , XF86MonBrightnessUp, exec, sudo mon_backlight +

  # Keyboard backlight
  binde = , XF86KbdBrightnessDown, exec, sudo kbd_backlight -
  binde = , XF86KbdBrightnessUp, exec, sudo kbd_backlight +

  # drun launcher
  bind = $mainMod, Z, exec, tofi-drun --drun-launch=true

  # bind = $mainMod, R, exec, wofi --show drun
  # bind = $mainMod, P, pseudo, # dwindle
  # bind = $mainMod, J, togglesplit, # dwindle

  # Move focus with mainMod + arrow keys
  bind = $mainMod, left, movefocus, l
  bind = $mainMod, right, movefocus, r
  bind = $mainMod, up, movefocus, u
  bind = $mainMod, down, movefocus, d

  # mod-[1..9], Switch to workspace N
  binde = $mainMod, 1, workspace, 1
  binde = $mainMod, 2, workspace, 2
  binde = $mainMod, 3, workspace, 3
  binde = $mainMod, 4, workspace, 4
  binde = $mainMod, 5, workspace, 5
  binde = $mainMod, 6, workspace, 6
  binde = $mainMod, 7, workspace, 7
  binde = $mainMod, 8, workspace, 8
  binde = $mainMod, 9, workspace, 9
  binde = $mainMod, 0, workspace, 10

  # mod-shift-[1..9], Move client to workspace N
  bind = $mainMod SHIFT, 1, movetoworkspacesilent, 1
  bind = $mainMod SHIFT, 2, movetoworkspacesilent, 2
  bind = $mainMod SHIFT, 3, movetoworkspacesilent, 3
  bind = $mainMod SHIFT, 4, movetoworkspacesilent, 4
  bind = $mainMod SHIFT, 5, movetoworkspacesilent, 5
  bind = $mainMod SHIFT, 6, movetoworkspacesilent, 6
  bind = $mainMod SHIFT, 7, movetoworkspacesilent, 7
  bind = $mainMod SHIFT, 8, movetoworkspacesilent, 8
  bind = $mainMod SHIFT, 9, movetoworkspacesilent, 9
  bind = $mainMod SHIFT, 0, movetoworkspacesilent, 10

  # Move/resize windows with mainMod + LMB/RMB and dragging
  bindm = $mainMod, mouse:272, movewindow
  bindm = $mainMod, mouse:273, resizewindow
''
