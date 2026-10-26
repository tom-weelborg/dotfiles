{
  options = {
    isNormalUser = true;
    displayname = "Tom";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  configFunction = username: { config, lib, pkgs, ... }: {
    modules = {
      programs = {
        cli = {
          cryptography = {
            age = {
              userModule = {
                ${username} = {
                  enable = true;
                };
              };
            };
            sops = {
              userModule = {
                ${username} = {
                  enable = true;
                };
              };
            };
            ssh-to-age = {
              userModule = {
                ${username} = {
                  enable = true;
                };
              };
            };
          };
          development = {
            docker = {
              userModule = {
                ${username} = {
                  enable = true;
                };
              };
            };
            git = {
              homeManagerModule = {
                ${username} = {
                  enable = true;
                  name = "Tom Weelborg";
                  email = "135610355+tom-weelborg@users.noreply.github.com";
                };
              };
            };
          };
        };
        gui = {
          browsers = {
            brave = {
              homeManagerModule = {
                ${username} = {
                  enable = true;
                  extraExtensions = [
                    "bhlhnicpbhignbdhedgjhgdocnmhomnp" # ColorZilla
                    "mmioliijnhnoblpgimnlajmefafdfilb" # Shazam: Find song names from your browser
                  ];
                };
              };
            };
            firefox = {
              homeManagerModule = {
                ${username} = {
                  enable = true;
                };
              };
            };
          };
          development = {
            jetbrains = {
              intellij = {
                homeManagerModule = {
                  ${username} = {
                    enable = true;
                  };
                };
              };
            };
            virtualbox = {
              userModule = {
                ${username} = {
                  enable = true;
                };
              };
            };
            vscodium = {
              homeManagerModule = {
                ${username} = {
                  enable = true;
                  extensionProfiles = {
                    angular = true;
                    bootstrap = true;
                    docker = true;
                    git = true;
                    github = true;
                    gitlab = true;
                    html = true;
                    http = true;
                    java = true;
                    javascript = true;
                    latex = true;
                    markdown = true;
                    nix = true;
                    php = true;
                    python = true;
                    rust = true;
                    slidev = true;
                    svelte = true;
                    tailwind = true;
                    typescript = true;
                    vue = true;
                    xml = true;
                  };
                };
              };
            };
          };
          media = {
            makemkv = {
              userModule = {
                ${username} = {
                  enable = true;
                  package = pkgs.makemkv-2026-08;
                  tokenPath = config.sops.secrets.makemkv-token.path;
                };
              };
            };
            obs = {
              homeManagerModule = {
                ${username} = {
                  enable = true;
                };
              };
            };
          };
        };
      };
      system = {
        desktop-environments = {
          gnome = {
            homeManagerModule = {
              ${username} = {
                enable = true;
                favoriteApps = [
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
                gnomeExtensions = with pkgs.gnomeExtensions; [
                  arcmenu
                  dash-to-panel
                ];
              };
            };
          };
        };
        hardware = {
          razer = {
            userModule = {
              ${username} = {
                enable = true;
              };
            };
          };
        };
        home-manager = {
          homeManagerModule = {
            ${username} = {
              enable = true;
            };
          };
        };
        sops-config = {
          userModule = {
            ${username} = {
              enable = true;
              secrets = {
                makemkv-token = {
                  sopsFile = ../secrets.yaml;
                };
              };
            };
          };
        };
      };
    };
  };
}
