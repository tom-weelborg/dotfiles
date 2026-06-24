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

  userModule = { }:
    { username }:
    { lib, pkgs, ... }:
    {
      users.users.${username}.packages = lib.mkAfter [
        pkgs.libreoffice
      ];
    };
}
