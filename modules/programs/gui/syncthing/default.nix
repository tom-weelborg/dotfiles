{
  systemModule = { config, lib, ... }:
    let
      cfg = config.modules.programs.gui.syncthing;
    in
    {
      options.modules.programs.gui.syncthing = {
        enable = lib.mkEnableOption "syncthing";
      };

      config = lib.mkIf cfg.enable {
        services.syncthing = {
          enable = true;
          openDefaultPorts = true;
        };
      };
    };

  userModule = {
    programs.gui.syncthing =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.syncthing
        ];
      };
  };

  homeManagerModule = {
    programs.gui.syncthing =
      { }:
      { username }:
      { ... }:
      {
        services.syncthing = {
          enable = true;
        };
      };
  };
}
