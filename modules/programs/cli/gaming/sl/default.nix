{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.cli.gaming.sl;
    in
    {
      options.modules.programs.cli.gaming.sl = {
        enable = lib.mkEnableOption "sl";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.sl
        ];
      };
    };

  userModule = {
    programs.cli.gaming.sl =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.sl
        ];
      };
  };

  homeManagerModule = {
    programs.cli.gaming.sl =
      { }:
      { username }:
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.sl
        ];
      };
  };
}
