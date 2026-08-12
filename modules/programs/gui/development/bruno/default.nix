{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.development.bruno;
    in
    {
      options.modules.programs.gui.development.bruno = {
        enable = lib.mkEnableOption "bruno";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.bruno
        ];
      };
    };

  userModule = {
    programs.gui.development.bruno =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.bruno
        ];
      };
  };

  homeManagerModule = {
    programs.gui.development.bruno =
      { }:
      { username }:
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.bruno
        ];
      };
  };
}
