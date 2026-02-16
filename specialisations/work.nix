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
            extraExtensions = overrideFunction [
              pkgs.nur.repos.rycee.firefox-addons.requestly
            ];
          };
        };
      };
    };


    displaylink = {
      enable = overrideFunction true;
    };
    docker = {
      enable = overrideFunction true;
    };
    git = {
      enable = overrideFunction true;
      extraSettings = overrideFunction {
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
    jetbrains = {
      enable = overrideFunction true;
    };
    keepassxc = {
      enable = overrideFunction true;
    };
    makemkv = {
      enable = overrideFunction true;
    };
    microsoft = {
      teams = {
        enable = overrideFunction true;
      };
    };
    mumble = {
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