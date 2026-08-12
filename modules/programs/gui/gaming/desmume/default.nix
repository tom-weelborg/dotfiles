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

  userModule = {
    programs.gui.gaming.desmume =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.desmume
        ];
      };
  };

  homeManagerModule = {
    programs.gui.gaming.desmume =
      { }:
      { username }:
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.desmume
        ];
      };
  };
}
