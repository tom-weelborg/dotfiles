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

  userModule = {
    programs.gui.microsoft.teams =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.teams-for-linux
        ];
      };
  };

  homeManagerModule = {
    programs.gui.microsoft.teams =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        home.packages =
          (lib.optionals pkgs.stdenv.isDarwin [
            pkgs.teams
          ])
          ++
          (lib.optionals pkgs.stdenv.isLinux [
            pkgs.teams-for-linux
          ])
          ;
      };
  };
}
