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
        vpn = {
          openvpn = {
            enable = overrideFunction true;
          };
          wireguard = {
            enable = overrideFunction true;
          };
        };
      };
      gui = {
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
          virtualbox = {
            enable = overrideFunction false;
          };
        };
        drawio = {
          enable = overrideFunction true;
        };
        keepassxc = {
          enable = overrideFunction true;
        };
        libreoffice = {
          enable = overrideFunction true;
        };
        media = {
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
      hardware = {
        displaylink = {
          enable = overrideFunction true;
        };
        razer = {
          enable = overrideFunction true;
        };
      };
      xdg = {
        mime = {
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
}
