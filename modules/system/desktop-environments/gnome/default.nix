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
      
      home-manager.users.${variables.username} = { ... }:
      {
        dconf.settings = {
          "org/gnome/shell" = {
            favorite-apps = moduleConfig.favoriteApps;
          };
        };
      };
    };
}
