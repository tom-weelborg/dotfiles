{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.development.dbeaver;
    in
    {
      options.modules.programs.gui.development.dbeaver = {
        enable = lib.mkEnableOption "dbeaver";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.dbeaver-bin
        ];
      };
    };

  userModule = {
    programs.gui.development.dbeaver =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.dbeaver-bin
        ];
      };
  };
}
