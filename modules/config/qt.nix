{ pkgs, ... }:
{
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  # All this just to make dolphin look acceptable!
  xdg.configFile."Kvantum/kvantum.kvconfig".source =
    (pkgs.formats.ini { }).generate "kvantum.kvconfig"
      { General.theme = "Nordic-Darker"; };

  xdg.configFile."dolphinrc".source = (pkgs.formats.ini { }).generate "dolphinrc" {
    UiSettings.ColorScheme = "*";
  };

  xdg.configFile."kdeglobals".source = (pkgs.formats.ini { }).generate "kdeblobals" {
    Icons.Theme = "Nordic-darker";
  };

  xdg.configFile."qt5ct/qt5ct.conf".source = (pkgs.formats.ini { }).generate "qt5ct.conf" {
    Appearance.icon_theme = "Nordic-darker";
  };

  xdg.configFile."qt6ct/qt6ct.conf".source = (pkgs.formats.ini { }).generate "qt6ct.conf" {
    Appearance.icon_theme = "Nordic-darker";
  };

}
