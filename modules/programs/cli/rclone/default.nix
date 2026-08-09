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
      { ... }:
      {
        home-manager.users.${username} = { ... }:
        {
          programs.rclone = {
            enable = true;
          };
        };
      };
  };
}
