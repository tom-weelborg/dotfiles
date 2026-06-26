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
      kernel = {
        modules = [
          "sg"
        ];
      };
      nix = {
        access-tokens-path = config.sops.secrets.access-tokens.path;
      };
      sops = {
        keyFile = "/home/${variables.username}/.config/sops/age/keys.txt";
      };
    };
  };

  imports = [
    ./hardware-configuration.nix
    ../../../../specialisations/work.nix
    (import ../../../../users users)
  ];
}
