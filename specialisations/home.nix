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
            extraSettings = overrideFunction {};
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
          };
        };
        gaming = {
          edopro = {
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
          vlc = {
            enable = overrideFunction true;
          };
        };
        obsidian = {
          enable = overrideFunction true;
        };
      };
    };


    docker = {
      enable = overrideFunction true;
    };
    openvpn = {
      enable = overrideFunction true;
    };
  };
}