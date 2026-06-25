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
    (userModules.sops {})
    (userModules.ssh-to-age {})
    (userModules.docker {})
    (userModules.git {
      name = variables.git.name;
      email = variables.git.email;
    })
    (userModules.brave {
      extraExtensions = [
        "bhlhnicpbhignbdhedgjhgdocnmhomnp" # ColorZilla
        "mmioliijnhnoblpgimnlajmefafdfilb" # Shazam: Find song names from your browser
      ];
    })
    (userModules.firefox {})
    (userModules.intellij {})
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
    })
    (userModules.gnome {
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
    })
    (userModules.razer {})
    (userModules.home-manager {})
  ];
}
