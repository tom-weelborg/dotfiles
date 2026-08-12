{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.libreoffice;
    in
    {
      options.modules.programs.gui.libreoffice = {
        enable = lib.mkEnableOption "libreoffice";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.libreoffice
        ];
      };
    };

  userModule = {
    programs.gui.libreoffice =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.libreoffice
        ];
      };
  };

  homeManagerModule = {
    programs.gui.libreoffice =
      { }:
      { username }:
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.libreoffice
        ];
      };
  };
}
