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
        media = {
          imagemagick = {
            systemModule = {
              enable = overrideFunction true;
            };
          };
        };
      };
      gui = {
        browsers = {
          edge = {
            systemModule = {
              enable = overrideFunction true;
            };
          };
        };
        communication = {
          discord = {
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
          postman = {
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
        gaming = {
          desmume = {
            systemModule = {
              enable = overrideFunction true;
            };
          };
          edopro = {
            systemModule = {
              enable = overrideFunction true;
            };
          };
          steam = {
            systemModule = {
              enable = overrideFunction true;
            };
          };
        };
        keepassxc = {
          systemModule = {
            enable = overrideFunction true;
          };
        };
        media = {
          audacity = {
            systemModule = {
              enable = overrideFunction true;
            };
          };
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
          spotify = {
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
        obsidian = {
          systemModule = {
            enable = overrideFunction true;
          };
        };
        syncthing = {
          systemModule = {
            enable = overrideFunction false;
          };
        };
      };
    };
    system = {
      hardware = {
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
              "microsoft-edge.desktop"
            ];
          };
        };
      };
    };
  };
}
