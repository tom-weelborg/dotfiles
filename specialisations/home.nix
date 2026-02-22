{ overrideFunction, pkgs, ... }:
{
  modules = {
    programs = {
      cli = {
        development = {
          docker = {
            enable = overrideFunction true;
          };
          git = {
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
        media = {
          imagemagick = {
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
          };
        };
        development = {
          jetbrains = {
            intellij = {
              enable = overrideFunction true;
            };
          };
          vscodium = {
            enable = overrideFunction true;
            extensionProfiles = {
              javascript = overrideFunction true;
            };
          };
        };
        gaming = {
          desmume = {
            enable = overrideFunction true;
          };
          edopro = {
            enable = overrideFunction true;
          };
          steam = {
            enable = overrideFunction true;
          };
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
          spotify = {
            enable = overrideFunction true;
          };
          vlc = {
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
            "brave-browser.desktop"
            "org.gnome.Nautilus.desktop"
            "pinta.desktop"
            "com.obsproject.Studio.desktop"
            "org.shotcut.Shotcut.desktop"
            "org.keepassxc.KeePassXC.desktop"
            "idea.desktop"
            "codium.desktop"
            "obsidian.desktop"
          ];
        };
      };
      hardware = {
        razer = {
          enable = overrideFunction true;
        };
      };
    };
  };
}