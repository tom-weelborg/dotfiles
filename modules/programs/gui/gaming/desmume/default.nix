{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.gaming.desmume;
    in
    {
      options.modules.programs.gui.gaming.desmume = {
        enable = lib.mkEnableOption "desmume";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.desmume
        ];
      };
    };

  userModule = { }:
    { username }:
    { lib, pkgs, ... }:
    {
      users.users.${username}.packages = lib.mkAfter [
        pkgs.desmume
      ];
    };
}
