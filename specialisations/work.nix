{ overrideFunction, pkgs, ... }:
{
  modules = {
    programs = {
      cli = {
        development = {
          direnv = {
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
        };
        fastfetch = {
          enable = overrideFunction true;
        };
        gaming = {
          cowsay = {
            enable = overrideFunction true;
          };
          fortune = {
            enable = overrideFunction true;
          };
          sl = {
            enable = overrideFunction true;
          };
        };
        openvpn = {
          enable = overrideFunction true;
        };
      };
      gui = {
        browsers = {
          brave = {
            enable = overrideFunction true;
          };
          firefox = {
            enable = overrideFunction true;
            extraExtensions = overrideFunction [
              pkgs.nur.repos.rycee.firefox-addons.aws-extend-switch-roles3
              pkgs.nur.repos.rycee.firefox-addons.requestly
            ];
          };
          vivaldi = {
            enable = overrideFunction true;
          };
        };
        communication = {
          mumble = {
            enable = overrideFunction true;
          };
          signal = {
            enable = overrideFunction true;
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
          virtualbox = {
            enable = overrideFunction true;
          };
          vscodium = {
            enable = overrideFunction true;
            extensionProfiles = {
              angular = overrideFunction true;
              javascript = overrideFunction true;
              rust = overrideFunction true;
              vue = overrideFunction true;
            };
          };
        };
        drawio = {
          enable = overrideFunction true;
        };
        keepassxc = {
          enable = overrideFunction true;
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
          onedrive = {
            enable = overrideFunction true;
          };
          teams = {
            enable = overrideFunction true;
          };
        };
        obsidian = {
          enable = overrideFunction true;
        };
      };
    };
    system = {
      desktop-environments = {
        gnome = {
          favoriteApps = overrideFunction [
            "firefox.desktop"
            "vivaldi-stable.desktop"
            "brave-browser.desktop"
            "org.gnome.Nautilus.desktop"
            "org.keepassxc.KeePassXC.desktop"
            "teams-for-linux.desktop"
            "info.mumble.Mumble.desktop"
            "idea.desktop"
            "codium.desktop"
            "obsidian.desktop"
          ];
        };
      };
      hardware = {
        displaylink = {
          enable = overrideFunction true;
        };
        razer = {
          enable = overrideFunction true;
        };
      };
    };
  };
}