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

  userModule = {
    system.desktop-environments.gnome =
      { favoriteApps ? [], gnomeExtensions ? [] }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter gnomeExtensions;

        home-manager.users.${username} = { ... }:
        {
          dconf.settings = {
            "org/gnome/desktop/interface" = {
              color-scheme = "prefer-dark";
              show-battery-percentage = true;
            };
            "org/gnome/desktop/wm/preferences" = {
              "button-layout" = ":minimize,maximize,close";
            };
            "org/gnome/settings-daemon/plugins/power" = {
              sleep-inactive-ac-type = "nothing";
            };
            "org/gtk/gtk4/settings/file-chooser" = {
              show-hidden = true;
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
          };
        };

        nixpkgs.overlays = [
          (final: prev: {
            gnomeExtensions = prev.gnomeExtensions // {
              arcmenu = prev.gnomeExtensions.arcmenu.overrideAttrs (old: rec {
                version = "69.2";

                src = prev.fetchFromGitLab {
                  owner = "arcmenu";
                  repo = "ArcMenu";
                  rev = "v${version}";
                  hash = "sha256-BdvFeoXwGxFlBH1JqcSDAKMzN+wBEmZdsz+gXWxQF6Y=";
                };
              });
            };
          })
        ];
      };
  };
}
