{
  options = lib:
    {
      favoriteApps = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
      };
    };

  module = { moduleConfig, pkgs, variables, ... }:
    {
      services.displayManager.gdm.enable = true;
      services.desktopManager.gnome.enable = true;

      environment.systemPackages = with pkgs.gnomeExtensions; [
        dash-to-panel
      ];

      home-manager.users.${variables.username} = { ... }:
      {
        dconf.settings = {
          "org/gnome/desktop/wm/preferences" = {
            "button-layout" = ":minimize,maximize,close";
          };
          "org/gnome/shell" = {
            enabled-extensions = [
              pkgs.gnomeExtensions.dash-to-panel.extensionUuid
            ];
            favorite-apps = moduleConfig.favoriteApps;
          };
        };
      };
    };
}
