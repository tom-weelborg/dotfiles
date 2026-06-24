{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.microsoft.teams;
    in
    {
      options.modules.programs.gui.microsoft.teams = {
        enable = lib.mkEnableOption "teams";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.teams-for-linux
        ];
      };
    };

  userModule = { }:
    { username }:
    { lib, pkgs, ... }:
    {
      users.users.${username}.packages = lib.mkAfter [
        pkgs.teams-for-linux
      ];
    };
}
