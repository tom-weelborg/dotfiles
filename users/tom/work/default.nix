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
            claude-code = {
              userModule = {
                ${username} = {
                  enable = true;
                };
              };
            };
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
                  email = null;
                  extraSettings = {
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
                  secretOptions = {
                    user = {
                      email = config.sops.secrets.git-email.path;
                    };
                  };
                };
              };
            };
          };
          rclone = {
            homeManagerModule = {
              ${username} = {
                enable = true;
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
                    "jpmkfafbacpgapdghgdpembnojdlgkdl" # AWS Extend Switch Roles
                    "mdnleldcmiljblolnjhpnblkcekpdkpa" # Requestly: Supercharge your Development & QA
                  ];
                };
              };
            };
            firefox = {
              homeManagerModule = {
                ${username} = {
                  enable = true;
                  extraExtensions = with pkgs.firefox-addons; [
                    aws-extend-switch-roles3
                    requestly
                  ];
                };
              };
            };
            vivaldi = {
              homeManagerModule = {
                ${username} = {
                  enable = true;
                  extraExtensions = [
                    "jpmkfafbacpgapdghgdpembnojdlgkdl" # AWS Extend Switch Roles
                    "mdnleldcmiljblolnjhpnblkcekpdkpa" # Requestly: Supercharge your Development & QA
                  ];
                };
              };
            };
          };
          development = {
            jaspersoft-studio = {
              userModule = {
                ${username} = {
                  enable = true;
                };
              };
            };
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
            soapui = {
              homeManagerModule = {
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
                    java = true;
                    javascript = true;
                    markdown = true;
                    nix = true;
                    python = true;
                    rust = true;
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
            xreader = {
              userModule = {
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
                git-email = {
                  sopsFile = ./secrets.yaml;
                };
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
