{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.trpb.desktopEnvironment = {

    portalPackage = lib.mkPackageOption pkgs "xdg-desktop-portal-hyprland" { };

    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the desktop environment config for user <name>";
    };

    monitor = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "Hyprland monitor configuration";
    };

    bind = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "Additional bind= entries for hyprland";
    };

    exec = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "Additional exec-once= entries for hyprland";
    };

    env = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "Additional env= entries for hyprland";
    };

    applications.browser = lib.mkOption {
      type = lib.types.str;
      default = "firefox";
      description = "Browser to launch on meta+f";
    };

    applications.terminal = lib.mkOption {
      type = lib.types.str;
      default = "neovide -- term";
      description = "Terminal to launch on meta+enter";
    };

    applications.launcher = lib.mkOption {
      type = lib.types.str;
      default = "walker";
      description = "launcher to launch on meta+shift+enter";
    };

    applications.audio-control = lib.mkOption {
      type = lib.types.str;
      default = "pwvucontrol";
      description = "Audio control (meta+v) and waybar right click";
    };

    applications.file-manager = lib.mkOption {
      type = lib.types.str;
      default = "dolphin";
      description = "File managger on meta+d";
    };

    waybar.output = lib.mkOption {
      type = lib.types.str;
      default = "DP-1";
      description = "Waybar output";
    };

  };
}
