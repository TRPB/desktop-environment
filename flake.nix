{
  outputs =
    {
      self,
    }:
    {
      homeManagerModules.desktopEnvironment = import ./modules/desktop-environment.nix;
    };
}
