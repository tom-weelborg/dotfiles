{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.cli.rclone;
    in
    {
      options.modules.programs.cli.rclone = {
        enable = lib.mkEnableOption "rclone";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.rclone
        ];
      };
    };

  userModule = {
    programs.cli.rclone =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.rclone
        ];
      };
  };

  homeManagerModule = {
    programs.cli.rclone =
      { }:
      { username }:
      { ... }:
      {
        programs.rclone = {
          enable = true;
        };
      };
  };
}
