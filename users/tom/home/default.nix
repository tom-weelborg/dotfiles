{ homeManagerModules, pkgs, userModules, ... }:
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
  homeManagerModules = [
    (homeManagerModules.programs.cli.development.git {
      name = "Tom Weelborg";
      email = "135610355+tom-weelborg@users.noreply.github.com";
    })
    (homeManagerModules.programs.gui.browsers.brave {
      extraExtensions = [
        "bhlhnicpbhignbdhedgjhgdocnmhomnp" # ColorZilla
        "mmioliijnhnoblpgimnlajmefafdfilb" # Shazam: Find song names from your browser
      ];
    })
    (homeManagerModules.programs.gui.browsers.firefox {})
    (homeManagerModules.programs.gui.development.jetbrains.intellij {})
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
    (homeManagerModules.system.desktop-environments.gnome {
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
    (homeManagerModules.system.home-manager {})
  ];
  userModules = [
    (userModules.programs.cli.cryptography.age {})
    (userModules.programs.cli.cryptography.sops {})
    (userModules.programs.cli.cryptography.ssh-to-age {})
    (userModules.programs.cli.development.docker {})
    (userModules.programs.gui.development.virtualbox {})
    (userModules.system.hardware.razer {})
  ];
}
