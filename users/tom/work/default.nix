{ config, homeManagerModules, pkgs, userModules, ... }:
{
  isNormalUser = true;
  displayname = "Tom";
  extraGroups = [
    "networkmanager"
    "wheel"
  ];
  homeManagerModules = [
    (homeManagerModules.programs.cli.development.git {
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
    (homeManagerModules.programs.cli.rclone {})
    (homeManagerModules.programs.gui.browsers.brave {
      extraExtensions = [
        "jpmkfafbacpgapdghgdpembnojdlgkdl" # AWS Extend Switch Roles
        "mdnleldcmiljblolnjhpnblkcekpdkpa" # Requestly: Supercharge your Development & QA
      ];
    })
    (homeManagerModules.programs.gui.browsers.firefox {
      extraExtensions = with pkgs.firefox-addons; [
        aws-extend-switch-roles3
        requestly
      ];
    })
    (homeManagerModules.programs.gui.browsers.vivaldi {
      extraExtensions = [
        "jpmkfafbacpgapdghgdpembnojdlgkdl" # AWS Extend Switch Roles
        "mdnleldcmiljblolnjhpnblkcekpdkpa" # Requestly: Supercharge your Development & QA
      ];
    })
    (homeManagerModules.programs.gui.development.jetbrains.intellij {})
    (homeManagerModules.programs.gui.development.soapui {})
    (homeManagerModules.programs.gui.development.vscodium {
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
    (homeManagerModules.programs.gui.media.obs {})
    (homeManagerModules.system.desktop-environments.gnome {
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
    (homeManagerModules.system.home-manager {})
  ];
  userModules = [
    (userModules.programs.cli.cryptography.age {})
    (userModules.programs.cli.cryptography.sops {})
    (userModules.programs.cli.cryptography.ssh-to-age {})
    (userModules.programs.cli.development.claude-code {})
    (userModules.programs.cli.development.docker {})
    (userModules.programs.gui.development.jaspersoft-studio {})
    (userModules.programs.gui.development.virtualbox {})
    (userModules.programs.gui.media.makemkv {})
    (userModules.system.hardware.razer {})
    (userModules.system.sops-config {
      secrets = {
        git-email = {
          sopsFile = ./secrets.yaml;
        };
      };
    })
  ];
}
