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
        media = {
          imagemagick = {
            enable = overrideFunction true;
          };
        };
      };
      gui = {
        browsers = {
          edge = {
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
          postman = {
            enable = overrideFunction true;
          };
          virtualbox = {
            enable = overrideFunction false;
          };
          vscodium = {
            enable = overrideFunction true;
            extensionProfiles = {
              angular = overrideFunction true;
              bootstrap = overrideFunction true;
              docker = overrideFunction true;
              git = overrideFunction true;
              github = overrideFunction true;
              gitlab = overrideFunction true;
              html = overrideFunction true;
              java = overrideFunction true;
              javascript = overrideFunction true;
              latex = overrideFunction true;
              markdown = overrideFunction true;
              nix = overrideFunction true;
              php = overrideFunction true;
              python = overrideFunction true;
              rust = overrideFunction true;
              slidev = overrideFunction true;
              svelte = overrideFunction true;
              tailwind = overrideFunction true;
              typescript = overrideFunction true;
              vue = overrideFunction true;
              xml = overrideFunction true;
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
      hardware = {
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
            "microsoft-edge.desktop"
          ];
        };
      };
    };
  };
}
