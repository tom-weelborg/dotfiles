{ config, overrideFunction, pkgs, userModules, ... }@inputs:
let
  username = "tom";

  users = {
    ${username} = (import ../../../../users/tom/work inputs);
  };
in
{
  sops.secrets.access-tokens = {
    sopsFile = ../../../../secrets.yaml;
  };

  modules = {
    programs = {
      cli = {
        vpn = {
          openvpn = {
            vpnDir = "/home/${username}/vpn";
          };
        };
      };
    };
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
      sops = {
        keyFile = "/home/${username}/.config/sops/age/keys.txt";
      };
    };
  };

  imports = [
    ./hardware-configuration.nix
    ../../../../specialisations/work.nix
    (import ../../../../users users)
  ];
}
