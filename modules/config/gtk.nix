{ pkgs, ... }:
{
  enable = true;

  theme = {
    package = pkgs.nordic;
    name = "Nordic";
  };

  iconTheme = {
    package = pkgs.nordic;
    name = "Nordic-darker";
  };

  font = {
    name = "DejaVu Sans";
    size = 11;
  };
}
