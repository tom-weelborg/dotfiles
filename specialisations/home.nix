{ overrideFunction, pkgs, ... }:
{
  modules = {
    programs = {
      gui = {
        browsers = {
          firefox = {
            enable = overrideFunction true;
          };
        };
      };
    };


    docker = {
      enable = overrideFunction true;
    };
    fastfetch = {
      enable = overrideFunction true;
    };
    git = {
      enable = overrideFunction true;
      extraSettings = overrideFunction {};
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