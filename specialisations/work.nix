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
        development = {
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
        };
        microsoft = {
          teams = {
            enable = overrideFunction true;
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
    jetbrains = {
      enable = overrideFunction true;
    };
    keepassxc = {
      enable = overrideFunction true;
    };
    makemkv = {
      enable = overrideFunction true;
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