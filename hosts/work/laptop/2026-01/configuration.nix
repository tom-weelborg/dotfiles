{ overrideFunction, pkgs, userModules, variables, ... }@inputs:
let
  users = {
    ${variables.username} = (import ../../../../users/tom/work inputs);
  };
in
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
    (import ../../../../users users)
  ];
}
