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
      { ... }:
      {
        home-manager.users.${username} = { ... }:
        {
          programs.direnv.enable = true;
        };
      };
  };
}
