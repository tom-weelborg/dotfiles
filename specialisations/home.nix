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
          edge = {
            enable = overrideFunction true;
          };
          firefox = {
            enable = overrideFunction true;
          };
        };
        communication = {
          discord = {
            enable = overrideFunction true;
          };
          signal = {
            enable = overrideFunction true;
          };
        };
        development = {
          jetbrains = {
            intellij = {
              enable = overrideFunction true;
            };
          };
          postman = {
            enable = overrideFunction true;
          };
          virtualbox = {
            enable = overrideFunction true;
          };
          vscodium = {
            enable = overrideFunction true;
            extensionProfiles = {
              angular = overrideFunction true;
              javascript = overrideFunction true;
              latex = overrideFunction true;
              svelte = overrideFunction true;
              vue = overrideFunction true;
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
          audacity = {
            enable = overrideFunction true;
          };
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
        syncthing = {
          enable = overrideFunction false;
        };
      };
    };
    system = {
      desktop-environments = {
        gnome = {
          favoriteApps = overrideFunction [
            "microsoft-edge.desktop"
            "firefox.desktop"
            "brave-browser.desktop"
            "org.gnome.Nautilus.desktop"
            "org.keepassxc.KeePassXC.desktop"
            "pinta.desktop"
            "com.obsproject.Studio.desktop"
            "audacity.desktop"
            "org.shotcut.Shotcut.desktop"
            "obsidian.desktop"
            "idea.desktop"
            "codium.desktop"
            "spotify.desktop"
            "discord.desktop"
            "steam.desktop"
            "io.github.edo9300.EDOPro.desktop"
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