{
  config,
  pkgs,
  lib,
  neovim,
  options,
  inputs,
  ...
}:
let
  qt = import ./config/qt.nix { pkgs = pkgs; };
  walker = import ./config/walker.nix { lib = lib; };
  fonts = import ./config/fonts.nix { pkgs = pkgs; };
  packages =
    fonts.fonts
    ++ import ./config/packages.nix {
      pkgs = pkgs;
    };

in
{
  imports = [ ./options.nix ];

  config = lib.mkIf (config.trpb.desktopEnvironment.enable) (
    lib.mkMerge [
      qt
      walker
      {
        wayland.windowManager.hyprland = {
          enable = true;
          settings = import ./config/hyprland.nix {
            monitor = config.trpb.desktopEnvironment.monitor;
            bind = config.trpb.desktopEnvironment.bind;
            exec = config.trpb.desktopEnvironment.exec;
            env = config.trpb.desktopEnvironment.env;
            applications = config.trpb.desktopEnvironment.applications;
          };
          plugins = [
            pkgs.hyprlandPlugins.hyprexpo
          ];
        };
        gtk = import ./config/gtk.nix { pkgs = pkgs; };
        xdg.portal = {
          enable = true;
          extraPortals = [
            config.trpb.desktopEnvironment.portalPackage
            pkgs.xdg-desktop-portal-gtk
          ];
          config = {
            hyprland = {
              default = [
                "gtk"
                "hyprland"
              ];
            };
            common = {
              default = [
                "gtk"
                "hyprland"
              ];
            };
          };
        };
        xdg.configFile = {
          "nwg-dock-hyprland/style.css".source = ./config/nwg-dock.css;
          "fish/conf.d/start-hyprland.fish".source = ./config/start-hyprland.fish;
          # Neovide is the terminal by default
          "neovide/config.toml".source =
            (pkgs.formats.toml { }).generate "config.toml"
              (import ./config/neovide.nix);
        };
        xdg.dataFile."applications/neovide.desktop".source = ./config/set-neovide-icon.desktop;
        services.wpaperd = import ./config/wpaperd.nix;
        home.packages = packages;
        fonts.fontconfig = fonts.fontconfig;
        programs.waybar = import ./config/waybar.nix {
          audio-control = config.trpb.desktopEnvironment.applications.audio-control;
          output = config.trpb.desktopEnvironment.waybar.output;
        };
      }
    ]
  );
}
