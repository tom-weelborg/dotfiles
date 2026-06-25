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

  userModule = { }:
    { username }:
    { lib, pkgs, ... }:
    {
      users.users.${username}.packages = lib.mkAfter [
        pkgs.age
      ];
    };
}
