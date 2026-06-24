{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.development.postman;
    in
    {
      options.modules.programs.gui.development.postman = {
        enable = lib.mkEnableOption "postman";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.postman
        ];
      };
    };

  userModule = { }:
    { username }:
    { lib, pkgs, ... }:
    {
      users.users.${username}.packages = lib.mkAfter [
        pkgs.postman
      ];
    };
}
