{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.cli.cryptography.age;
    in
    {
      options.modules.programs.cli.cryptography.age = {
        enable = lib.mkEnableOption "age";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.age
        ];
      };
    };

  userModule = {
    programs.cli.cryptography.age =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.age
        ];
      };
  };

  homeManagerModule = {
    programs.cli.cryptography.age =
      { }:
      { username }:
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.age
        ];
      };
  };
}
