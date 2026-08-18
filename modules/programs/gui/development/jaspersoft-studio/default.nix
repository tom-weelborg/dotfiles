{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.development.jaspersoft-studio;
    in
    {
      options.modules.programs.gui.development.jaspersoft-studio = {
        enable = lib.mkEnableOption "jaspersoft-studio";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.jaspersoft-studio
        ];
      };
    };

  userModule = {
    programs.gui.development.jaspersoft-studio =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.jaspersoft-studio
        ];
      };
  };

  homeManagerModule = {
    programs.gui.development.jaspersoft-studio =
      { }:
      { username }:
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.jaspersoft-studio
        ];
      };
  };
}
