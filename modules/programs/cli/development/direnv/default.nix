{
  systemModule = { config, lib, ... }:
    let
      cfg = config.modules.programs.cli.development.direnv;
    in
    {
      options.modules.programs.cli.development.direnv = {
        enable = lib.mkEnableOption "direnv";
      };

      config = lib.mkIf cfg.enable {
        programs.direnv.enable = true;
      };
    };

  userModule = {
    programs.cli.development.direnv =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.direnv
        ];
      };
  };

  homeManagerModule = {
    programs.cli.development.direnv =
      { }:
      { username }:
      { ... }:
      {
        programs.direnv = {
          enable = true;
        };
      };
  };
}
