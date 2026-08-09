{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.cli.gaming.fortune;
    in
    {
      options.modules.programs.cli.gaming.fortune = {
        enable = lib.mkEnableOption "fortune";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.fortune
        ];
      };
    };

  userModule = {
    programs.cli.gaming.fortune =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.fortune
        ];
      };
  };
}
