{
  systemModule = { config, lib, ... }:
    let
      cfg = config.modules.programs.gui.microsoft.onedrive;
    in
    {
      options.modules.programs.gui.microsoft.onedrive = {
        enable = lib.mkEnableOption "onedrive";
      };

      config = lib.mkIf cfg.enable {
        services.onedrive.enable = true;
      };
    };

  userModule = {
    programs.gui.microsoft.onedrive =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.onedrive
        ];
      };
  };

  homeManagerModule = {
    programs.gui.microsoft.onedrive =
      { }:
      { username }:
      { ... }:
      {
        programs.onedrive = {
          enable = true;
        };
      };
  };
}
