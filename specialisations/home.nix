{ overrideFunction, pkgs, ... }:
{
  modules = {
    programs = {
      cli = {
        fastfetch = {
          enable = overrideFunction true;
        };
      };
      gui = {
        browsers = {
          firefox = {
            enable = overrideFunction true;
          };
        };
        development = {
          git = {
            enable = overrideFunction true;
            extraSettings = overrideFunction {};
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
    makemkv = {
      enable = overrideFunction true;
    };
    obs = {
      enable = overrideFunction true;
    };
    obsidian = {
      enable = overrideFunction true;
    };
    openvpn = {
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
    vscodium = {
      enable = overrideFunction true;
    };
  };
}