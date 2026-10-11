{ lib, mkModule, ... }@args:
let
  enableOptionDescription = "gnome";
in
mkModule
  {
    modulePath = [
      "system"
      "desktop-environments"
      "gnome"
    ];
    systemModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
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
      mkConfig = { cfg }:
        lib.mkIf cfg.enable
        {
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
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
        favoriteApps = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [];
        };
        gnomeExtensions = lib.mkOption {
          type = lib.types.listOf lib.types.package;
          default = [];
        };
      };
      mkConfig = { cfg, username }: { ... }@homeManagerArgs:
        lib.mkIf cfg.enable
        {
          home.packages = cfg.gnomeExtensions;

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
                cfg.gnomeExtensions
                ;
              favorite-apps = cfg.favoriteApps;
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
  args
