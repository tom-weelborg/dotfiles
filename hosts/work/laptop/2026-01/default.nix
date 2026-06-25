{
  system = "x86_64-linux";

  config = { overrideFunction, pkgs, userModules, variables, ... }:
    let
      users = {
        ${variables.username} = {
          isNormalUser = true;
          displayname = variables.displayname;
          extraGroups = [
            "cdrom"
            "plugdev"
            "networkmanager"
            "video"
            "wheel"
          ];
          modules = [
            (userModules.docker {})
            (userModules.git {
              name = variables.git.name;
              email = variables.git.email;
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
            })
            (userModules.rclone {})
            (userModules.brave {
              extraExtensions = [
                "jpmkfafbacpgapdghgdpembnojdlgkdl" # AWS Extend Switch Roles
                # "bhlhnicpbhignbdhedgjhgdocnmhomnp" # ColorZilla
                "mdnleldcmiljblolnjhpnblkcekpdkpa" # Requestly: Supercharge your Development & QA
                # "mmioliijnhnoblpgimnlajmefafdfilb" # Shazam: Find song names from your browser
              ];
            })
            (userModules.firefox {
              extraExtensions = with pkgs.firefox-addons; [
                aws-extend-switch-roles3
                requestly
              ];
            })
            (userModules.vivaldi {
              extraExtensions = [
                "jpmkfafbacpgapdghgdpembnojdlgkdl" # AWS Extend Switch Roles
                "mdnleldcmiljblolnjhpnblkcekpdkpa" # Requestly: Supercharge your Development & QA
              ];
            })
            (userModules.intellij {})
            (userModules.soapui {})
            (userModules.virtualbox {})
            (userModules.vscodium {
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
                python = true;
                rust = true;
                tailwind = true;
                typescript = true;
                vue = true;
                xml = true;
              };
            })
            (userModules.gnome {
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
            })
            (userModules.razer {})
            (userModules.home-manager {})
          ];
        };
      };
    in
    {
      modules = {
        system = {
          desktop-environments = {
            gnome = {
              enable = true;
            };
          };
          home-manager = {
            enable = true;
          };
        };
      };

      imports = [
        ./hardware-configuration.nix
        ../../../../specialisations/work.nix
        (import ../../../../users users)
      ];
    };
}
