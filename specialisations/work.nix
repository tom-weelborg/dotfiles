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
        fastfetch = {
          enable = overrideFunction true;
        };
        gaming = {
          sl = {
            enable = overrideFunction true;
          };
        };
      };
      gui = {
        browsers = {
          firefox = {
            enable = overrideFunction true;
            extraExtensions = overrideFunction [
              pkgs.nur.repos.rycee.firefox-addons.aws-extend-switch-roles3
              pkgs.nur.repos.rycee.firefox-addons.requestly
            ];
          };
        };
        development = {
          bruno = {
            enable = overrideFunction true;
          };
          dbeaver = {
            enable = overrideFunction true;
          };
          jetbrains = {
            intellij = {
              enable = overrideFunction true;
            };
          };
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
    keepassxc = {
      enable = overrideFunction true;
    };
    mumble = {
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