{ overrideFunction, pkgs, ... }:
{
  modules = {
    system = {
      desktop-environments = {
        gnome = {
          enable = true;
        };
      };
      home-manager = {
        enable = true;
      };
    };
  };

  imports = [
    ./hardware-configuration.nix
    ../../../../specialisations/work.nix
  ];
}
