{ pkgs, ... }:
with pkgs;
[
  walker
  nwg-dock-hyprland
  waybar
  waybar-mpris
  kdePackages.dolphin
  kdePackages.qt6ct
  kdePackages.plasma-workspace
  kdePackages.ffmpegthumbs
  kdePackages.kdegraphics-thumbnailers
  pwvucontrol
  wl-clipboard
]
