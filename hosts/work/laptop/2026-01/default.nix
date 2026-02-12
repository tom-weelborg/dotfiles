{ pkgs, ... }:
{
  modules = {
    apps = {
      gui = {
        browsers = {
          firefox = {
            enable = true;
            extraExtensions = [
              pkgs.nur.repos.rycee.firefox-addons.requestly
            ];
          };
        };
      };
    };


    displaylink = {
      enable = true;
    };
    docker = {
      enable = true;
    };
    fastfetch = {
      enable = true;
    };
    git = {
      enable = true;
      extraSettings = {
        core = {
          autocrlf = "input";
          longpaths = true;
        };
        credential.helper = "manager";
        init.defaultBranch = "main";
        merge = {
          ff = false;
        };
        pull = {
          ff = "only";
          rebase = false;
        };
      };
    };
    gnome = {
      enable = true;
    };
    home = {
      enable = true;
    };
    jetbrains = {
      enable = true;
    };
    keepassxc = {
      enable = true;
    };
    makemkv = {
      enable = true;
    };
    microsoft = {
      teams = {
        enable = true;
      };
    };
    mumble = {
      enable = true;
    };
    obs = {
      enable = true;
    };
    obsidian = {
      enable = true;
    };
    openvpn = {
      enable = true;
    };
    pinta = {
      enable = true;
    };
    shotcut = {
      enable = true;
    };
    vlc = {
      enable = true;
    };
    vscodium = {
      enable = true;
    };
  };

  imports = [
    ./hardware-configuration.nix
  ];
}
