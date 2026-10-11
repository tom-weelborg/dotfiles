{ config, overrideFunction, pkgs, userModules, ... }@inputs:
let
  username = "tom";
in
{
  sops.secrets.access-tokens = {
    sopsFile = ../../../../secrets.yaml;
  };

  userConfig = {
    ${username} = "work";
  };

  modules = {
    programs = {
      cli = {
        shells = {
          bash = {
            systemModule = {
              enable = true;
            };
          };
        };
        vpn = {
          openvpn = {
            systemModule = {
              vpnDir = "/home/${username}/vpn";
            };
          };
        };
      };
    };
    system = {
      audio = {
        systemModule = {
          pipewire = {
            enable = true;
          };
          rtkit = {
            enable = true;
          };
        };
      };
      desktop-environments = {
        gnome = {
          systemModule = {
            enable = true;
          };
        };
      };
      home-manager = {
        systemModule = {
          enable = true;
        };
      };
      nix = {
        systemModule = {
          access-tokens-path = config.sops.secrets.access-tokens.path;
        };
      };
      printing = {
        systemModule = {
          enable = true;
        };
      };
      sops-config = {
        systemModule = {
          keyFile = "/home/${username}/.config/sops/age/keys.txt";
        };
      };
    };
  };

  imports = [
    ./hardware-configuration.nix
    ../../../../specialisations/work.nix
  ];
}
