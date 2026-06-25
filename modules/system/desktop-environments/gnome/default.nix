{
  systemModule = { config, lib, ... }:
    let
      cfg = config.modules.system.desktop-environments.gnome;
    in
    {
      options.modules.system.desktop-environments.gnome = {
        enable = lib.mkEnableOption "gnome";
      };

      config = lib.mkIf cfg.enable {
        services.displayManager.gdm.enable = true;
        services.desktopManager.gnome.enable = true;
      };
    };

  userModule = { favoriteApps ? [] }:
    { username }:
    { lib, pkgs, ... }:
    {
      users.users.${username}.packages = lib.mkAfter (with pkgs.gnomeExtensions; [
        arcmenu
        dash-to-panel
      ]);

      home-manager.users.${username} = { ... }:
      {
        dconf.settings = {
          "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
          };
          "org/gnome/desktop/wm/preferences" = {
            "button-layout" = ":minimize,maximize,close";
          };
          "org/gtk/gtk4/settings/file-chooser" = {
            show-hidden = true;
          };
          "org/gnome/shell" = {
            enabled-extensions = with pkgs.gnomeExtensions; [
              arcmenu.extensionUuid
              dash-to-panel.extensionUuid
            ];
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
}
