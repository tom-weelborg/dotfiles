{ config, pkgs, userModules, ... }:
{
  isNormalUser = true;
  displayname = "Tom";
  extraGroups = [
    "cdrom"
    "plugdev"
    "networkmanager"
    "video"
    "wheel"
  ];
  modules = [
    (userModules.programs.cli.cryptography.age {})
    (userModules.programs.cli.cryptography.sops {})
    (userModules.programs.cli.cryptography.ssh-to-age {})
    (userModules.programs.cli.development.docker {})
    (userModules.programs.cli.development.git {
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
    })
    (userModules.programs.cli.rclone {})
    (userModules.programs.gui.browsers.brave {
      extraExtensions = [
        "jpmkfafbacpgapdghgdpembnojdlgkdl" # AWS Extend Switch Roles
        "mdnleldcmiljblolnjhpnblkcekpdkpa" # Requestly: Supercharge your Development & QA
      ];
    })
    (userModules.programs.gui.browsers.firefox {
      extraExtensions = with pkgs.firefox-addons; [
        aws-extend-switch-roles3
        requestly
      ];
    })
    (userModules.programs.gui.browsers.vivaldi {
      extraExtensions = [
        "jpmkfafbacpgapdghgdpembnojdlgkdl" # AWS Extend Switch Roles
        "mdnleldcmiljblolnjhpnblkcekpdkpa" # Requestly: Supercharge your Development & QA
      ];
    })
    (userModules.programs.gui.development.jetbrains.intellij {})
    (userModules.programs.gui.development.soapui {})
    (userModules.programs.gui.development.virtualbox {})
    (userModules.programs.gui.development.vscodium {
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
    (userModules.system.desktop-environments.gnome {
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
    (userModules.system.hardware.razer {})
    (userModules.system.home-manager {})
    (userModules.system.sops-config {
      secrets = {
        git-email = {
          sopsFile = ./secrets.yaml;
        };
      };
    })
  ];
}
