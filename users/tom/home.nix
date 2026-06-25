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
