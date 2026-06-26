{ config, overrideFunction, pkgs, userModules, variables, ... }@inputs:
let
  users = {
    ${variables.username} = (import ../../../../users/tom/work inputs);
  };
in
{
  sops.secrets.access-tokens = {
    sopsFile = ../../../../secrets.yaml;
  };

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
      nix = {
        access-tokens-path = config.sops.secrets.access-tokens.path;
      };
    };
  };

  imports = [
    ./hardware-configuration.nix
    ../../../../specialisations/work.nix
    (import ../../../../users users)
  ];
}
