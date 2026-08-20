{
  systemModule = { config, lib, ... }:
    let
      cfg = config.modules.programs.cli.shells.bash;
    in
    {
      options.modules.programs.cli.shells.bash = {
        enable = lib.mkEnableOption "bash";
        shellAliases = lib.mkOption {
          type = lib.types.attrs;
          default = {
            cp = "cp -i";
            ln = "ln -i";
            mv = "mv -i";
            rm = "rm -i";
          };
        };
      };

      config = lib.mkIf cfg.enable {
        programs.bash = {
          enable = cfg.enable;
          shellAliases = cfg.shellAliases;
        };
      };
    };

  userModule = {
    programs.cli.shells.bash =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.bash
        ];
      };
  };

  homeManagerModule = {
    programs.cli.shells.bash =
      { shellAliases ? {} }:
      { username }:
      { ... }:
      {
        programs.bash = {
          enable = true;
          shellAliases = shellAliases;
        };
      };
  };
}
