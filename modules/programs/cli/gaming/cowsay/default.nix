{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.cli.gaming.cowsay;
    in
    {
      options.modules.programs.cli.gaming.cowsay = {
        enable = lib.mkEnableOption "cowsay";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.cowsay
        ];
      };
    };

  userModule = {
    programs.cli.gaming.cowsay =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.cowsay
        ];
      };
  };

  homeManagerModule = {
    programs.cli.gaming.cowsay =
      { }:
      { username }:
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.cowsay
        ];
      };
  };
}
