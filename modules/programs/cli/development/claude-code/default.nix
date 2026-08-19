{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.cli.development.claude-code;
    in
    {
      options.modules.programs.cli.development.claude-code = {
        enable = lib.mkEnableOption "claude-code";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.claude-code
        ];
      };
    };

  userModule = {
    programs.cli.development.claude-code =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.claude-code
        ];
      };
  };

  homeManagerModule = {
    programs.cli.development.claude-code =
      { }:
      { username }:
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.claude-code
        ];
      };
  };
}
