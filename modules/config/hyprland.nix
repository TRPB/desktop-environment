{
  monitor,
  exec,
  bind,
  env,
  applications,
  ...
}:
{
  env = [
    "HYPRCURSOR_THEME,Nordzy-cursors"
    # Required to set the gtk theme
    "GTK_USE_PORTAL,1"
  ] ++ env;

  exec-once = [
    "sleep 3 && wpaperd"
    "sleep 1"
    "nwg-dock-hyprland -p top -d -nolauncher"
    "waybar"
  ] ++ exec;

  plugin = {
    hyprexpo = {
      columns = 3;
      workspace_method = "first r~1";
      bg_col = "rgb(2e3440)";
    };
  };

  ecosystem = {
    no_donation_nag = true;
    no_update_news = true;
  };

  monitor = monitor;

  "$mainMod" = "SUPER";

  # debug = {
  #   full_cm_proto = true;
  # };
  #
  misc = {
    disable_hyprland_logo = true;
    force_default_wallpaper = 1;
    # vrr = 1;
  };

  input = {
    kb_layout = "gb";
    accel_profile = "flat";
    force_no_accel = 1;
    follow_mouse = 0;
    kb_options = "caps:escape";
    numlock_by_default = true;
    left_handed = false;
  };

  bindm = [
    "$mainMod, mouse:272, movewindow"
    "$mainMod, mouse:273, resizewindow"
  ];

  bind = [
    "$mainMod, RETURN, exec, ${applications.terminal}"
    "$mainMod SHIFT, RETURN, exec, ${applications.launcher}"
    "$mainMod, space, hyprexpo:expo, toggle"
    "$mainMod, F, exec, ${applications.browser}"
    "$mainMod, D, exec, ${applications.file-manager}"
    "$mainMod, P, exec, ${applications.audio-control}"
    "$mainMod, M, exit,"
    "$mainMod, Q, killactive,"
    "$mainMod, left, movefocus, l"
    "$mainMod, right, movefocus, r"
    "$mainMod, up, movefocus, u"
    "$mainMod, down, movefocus, d"
    "$mainMod, h, movefocus, l"
    "$mainMod, j, movefocus, d"
    "$mainMod, k, movefocus, u"
    "$mainMod, l, movefocus, r"
    "ALT SHIFT, RETURN, fullscreen"
    "$mainMod, 1, workspace, r~1"
    "$mainMod, 2, workspace, r~2"
    "$mainMod, 3, workspace, r~3"
    "$mainMod, 4, workspace, r~4"
    "$mainMod, 5, workspace, r~5"
    "$mainMod, 6, workspace, r~6"
    "$mainMod, 7, workspace, r~7"
    "$mainMod, 8, workspace, r~8"
    "$mainMod, 9, workspace, r~9"
    "$mainMod, 0, workspace, r~0"

    "$mainMod SHIFT, 1, movetoworkspace, r~1"
    "$mainMod SHIFT, 2, movetoworkspace, r~2"
    "$mainMod SHIFT, 3, movetoworkspace, r~3"
    "$mainMod SHIFT, 4, movetoworkspace, r~4"
    "$mainMod SHIFT, 5, movetoworkspace, r~5"
    "$mainMod SHIFT, 6, movetoworkspace, r~6"
    "$mainMod SHIFT, 7, movetoworkspace, r~7"
    "$mainMod SHIFT, 8, movetoworkspace, r~8"
    "$mainMod SHIFT, 9, movetoworkspace, r~9"
    "$mainMod SHIFT, 0, movetoworkspace, r~0"
    "$mainMod SHIFT, space, layoutmsg, togglesplit"

    "$mainMod SHIFT, left, movewindow, l"
    "$mainMod SHIFT, right, movewindow, r"
    "$mainMod SHIFT, up, movewindow, u"
    "$mainMod SHIFT, down, movewindow, d"
    "$mainMod SHIFT, h, movewindow, l"
    "$mainMod SHIFT, l, movewindow, r"
    "$mainMod SHIFT, k, movewindow, u"
    "$mainMod SHIFT, j, movewindow, d"

    "$mainMod, Z, exec, hyprctl keyword cursor:zoom_factor 2"
    "$mainMod SHIFT, Z, exec, hyprctl keyword cursor:zoom_factor 1"
    ", menu, exec, nwg-dock-hyprland"
  ] ++ bind;

  dwindle = {
    preserve_split = true;
  };

  cursor = {
    inactive_timeout = 5;
  };

  general = {
    gaps_in = 5;
    gaps_out = 0;
    border_size = 5;

    "col.active_border" = "rgba(81a1c1cc) rgba(5e81accc) 45deg";
    "col.inactive_border" = "rgba(4c566aaa)";
    resize_on_border = false;
    allow_tearing = false;
    layout = "dwindle";
  };

  windowrulev2 = [
    "suppressevent maximize,class:^(libreoffice.*)$"
  ];

  decoration = {
    rounding = 8;
    active_opacity = 1.0;
    inactive_opacity = 1.0;

    blur = {
      enabled = true;
      size = 16;
      passes = 1;
      vibrancy = 0.1696;
    };
  };
}
