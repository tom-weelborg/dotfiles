{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.cli.fastfetch;
    in
    {
      options.modules.programs.cli.fastfetch = {
        enable = lib.mkEnableOption "fastfetch";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.fastfetch
        ];
      };
    };

  userModule = {
    programs.cli.fastfetch =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.fastfetch
        ];
      };
  };

  homeManagerModule = {
    programs.cli.fastfetch =
      { }:
      { username }:
      { ... }:
      {
        programs.fastfetch = {
          enable = true;
        };
      };
  };
}
