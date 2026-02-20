{ overrideFunction, pkgs, ... }:
{
  modules = {
    system = {
      desktop-environments = {
        gnome = {
          enable = true;
        };
      };
    };

    home = {
      enable = true;
    };
  };

  imports = [
    ./hardware-configuration.nix
    ../../../../specialisations/work.nix
  ];
}
