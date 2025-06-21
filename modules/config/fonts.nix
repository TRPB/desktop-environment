{ pkgs, ... }:
{
  fonts = [
    pkgs.nerd-fonts.hack
  ];

  fontconfig = {
    enable = true;
    defaultFonts.monospace = [ "Hack Nerd Font" ];
  };
}
