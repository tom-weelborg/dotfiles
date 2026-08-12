{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.communication.discord;
    in
    {
      options.modules.programs.gui.communication.discord = {
        enable = lib.mkEnableOption "discord";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.discord
        ];
      };
    };

  userModule = {
    programs.gui.communication.discord =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.discord
        ];
      };
  };

  homeManagerModule = {
    programs.gui.communication.discord =
      { }:
      { username }:
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.discord
        ];
      };
  };
}
