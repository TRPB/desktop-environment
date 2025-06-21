{ lib, ... }:
{
  xdg.configFile = {
    "walker/config.toml".text = lib.generators.toINIWithGlobalSection { } (import ./walker/walker.nix);

    "walker/themes/nord.toml".source = ./walker/nord.toml;
    "walker/themes/nord.css".source = ./walker/nord.css;
  };
}
