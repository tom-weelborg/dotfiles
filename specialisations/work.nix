{ overrideFunction, pkgs, ... }:
{
  modules = {
    programs = {
      cli = {
        development = {
          direnv = {
            systemModule = {
              enable = overrideFunction true;
            };
          };
          docker = {
            systemModule = {
              enable = overrideFunction true;
            };
          };
        };
        fastfetch = {
          systemModule = {
            enable = overrideFunction true;
          };
        };
        gaming = {
          cowsay = {
            systemModule = {
              enable = overrideFunction true;
            };
          };
          fortune = {
            systemModule = {
              enable = overrideFunction true;
            };
          };
          sl = {
            systemModule = {
              enable = overrideFunction true;
            };
          };
        };
        vpn = {
          openvpn = {
            systemModule = {
              enable = overrideFunction true;
            };
          };
          wireguard = {
            systemModule = {
              enable = overrideFunction true;
            };
          };
        };
      };
      gui = {
        communication = {
          mumble = {
            systemModule = {
              enable = overrideFunction true;
            };
          };
          signal = {
            systemModule = {
              enable = overrideFunction true;
            };
          };
        };
        development = {
          bruno = {
            systemModule = {
              enable = overrideFunction true;
            };
          };
          dbeaver = {
            systemModule = {
              enable = overrideFunction true;
            };
          };
          virtualbox = {
            systemModule = {
              enable = overrideFunction false;
            };
          };
        };
        drawio = {
          systemModule = {
            enable = overrideFunction true;
          };
        };
        keepassxc = {
          systemModule = {
            enable = overrideFunction true;
          };
        };
        libreoffice = {
          systemModule = {
            enable = overrideFunction true;
          };
        };
        media = {
          pinta = {
            systemModule = {
              enable = overrideFunction true;
            };
          };
          shotcut = {
            systemModule = {
              enable = overrideFunction true;
            };
          };
          vlc = {
            systemModule = {
              enable = overrideFunction true;
            };
          };
        };
        microsoft = {
          onedrive = {
            systemModule = {
              enable = overrideFunction true;
            };
          };
          teams = {
            systemModule = {
              enable = overrideFunction true;
            };
          };
        };
        obsidian = {
          systemModule = {
            enable = overrideFunction true;
          };
        };
      };
    };
    system = {
      hardware = {
        displaylink = {
          systemModule = {
            enable = overrideFunction true;
          };
        };
        razer = {
          systemModule = {
            enable = overrideFunction true;
          };
        };
      };
      xdg = {
        mime = {
          systemModule = {
            enable = overrideFunction true;
            browsers = overrideFunction [
              "firefox.desktop"
              "brave-browser.desktop"
              "vivaldi-stable.desktop"
            ];
          };
        };
      };
    };
  };
}
