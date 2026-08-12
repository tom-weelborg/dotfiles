{
  systemModule = { config, lib, ... }:
    let
      cfg = config.modules.system.desktop-environments.gnome;
    in
    {
      options.modules.system.desktop-environments.gnome = {
        enable = lib.mkEnableOption "gnome";
        xserver = {
          enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
          };

          xkb = {
            layout = lib.mkOption {
              type = lib.types.str;
              default = "de";
            };
            variant = lib.mkOption {
              type = lib.types.str;
              default = "";
            };
          };
        };
      };

      config = lib.mkIf cfg.enable {
        services.displayManager.gdm.enable = true;
        services.desktopManager.gnome.enable = true;

        services.xserver = {
          enable = cfg.xserver.enable;
          xkb = {
            layout = cfg.xserver.xkb.layout;
            variant = cfg.xserver.xkb.variant;
          };
        };
      };
    };

  homeManagerModule = {
    system.desktop-environments.gnome =
      { favoriteApps ? [], gnomeExtensions ? [] }:
      { username }:
      { ... }:
      {
        home.packages = gnomeExtensions;

        dconf.settings = {
          "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
            show-battery-percentage = true;
          };
          "org/gnome/desktop/wm/preferences" = {
            "button-layout" = ":minimize,maximize,close";
          };
          "org/gnome/nautilus/preferences" = {
            default-folder-viewer = "list-view";
          };
          "org/gnome/settings-daemon/plugins/power" = {
            sleep-inactive-ac-type = "nothing";
          };
          "org/gnome/shell" = {
            enabled-extensions = map
              (e: e.extensionUuid)
              gnomeExtensions
              ;
            favorite-apps = favoriteApps;
          };
          "org/gnome/shell/extensions/arcmenu" = {
            multi-monitor = true;
          };
          "org/gtk/gtk4/settings/file-chooser" = {
            show-hidden = true;
          };
        };
      };
  };
}
