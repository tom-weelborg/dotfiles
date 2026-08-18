{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.gaming.supertuxkart;
    in
    {
      options.modules.programs.gui.gaming.supertuxkart = {
        enable = lib.mkEnableOption "supertuxkart";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.supertuxkart
        ];
      };
    };

  userModule = {
    programs.gui.gaming.supertuxkart =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.supertuxkart
        ];
      };
  };

  homeManagerModule = {
    programs.gui.gaming.supertuxkart =
      { }:
      { username }:
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.supertuxkart
        ];
      };
  };
}
