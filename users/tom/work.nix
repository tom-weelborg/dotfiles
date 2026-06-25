{ pkgs, userModules, variables, ... }:
{
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
    (userModules.age {})
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
        "mdnleldcmiljblolnjhpnblkcekpdkpa" # Requestly: Supercharge your Development & QA
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
        nix = true;
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
      gnomeExtensions = with pkgs.gnomeExtensions; [
        arcmenu
        dash-to-panel
      ];
    })
    (userModules.razer {})
    (userModules.home-manager {})
  ];
}
