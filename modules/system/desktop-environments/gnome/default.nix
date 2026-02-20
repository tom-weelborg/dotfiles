{ pkgs, variables, ... }:
{
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  
  home-manager.users.${variables.username} = { ... }:
  {
    dconf.settings = {
      "org/gnome/shell" = {
        favorite-apps = [
          "firefox.desktop"
          "org.gnome.Nautilus.desktop"
          "pinta.desktop"
          "com.obsproject.Studio.desktop"
          "org.shotcut.Shotcut.desktop"
          "org.keepassxc.KeePassXC.desktop"
          "teams-for-linux.desktop"
          "info.mumble.Mumble.desktop"
          "idea.desktop"
          "codium.desktop"
          "obsidian.desktop"
        ];
      };
    };
  };
}
