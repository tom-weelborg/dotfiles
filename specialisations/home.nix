{ overrideFunction, pkgs, ... }:
{
  modules = {
    hardware = {
      razer = {
        enable = overrideFunction true;
      };
    };
    programs = {
      cli = {
        development = {
          git = {
            enable = overrideFunction true;
            extraSettings = overrideFunction {};
          };
        };
        fastfetch = {
          enable = overrideFunction true;
        };
        media = {
          imagemagick = {
            enable = overrideFunction true;
          };
        };
      };
      gui = {
        browsers = {
          firefox = {
            enable = overrideFunction true;
          };
        };
        development = {
          vscodium = {
            enable = overrideFunction true;
          };
        };
        media = {
          makemkv = {
            enable = overrideFunction true;
          };
          obs = {
            enable = overrideFunction true;
          };
          pinta = {
            enable = overrideFunction true;
          };
          shotcut = {
            enable = overrideFunction true;
          };
          vlc = {
            enable = overrideFunction true;
          };
        };
      };
    };


    docker = {
      enable = overrideFunction true;
    };
    jetbrains = {
      enable = overrideFunction true;
    };
    keepassxc = {
      enable = overrideFunction true;
    };
    obsidian = {
      enable = overrideFunction true;
    };
    openvpn = {
      enable = overrideFunction true;
    };
  };
}