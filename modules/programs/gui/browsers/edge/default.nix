{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.browsers.edge;
    in
    {
      options.modules.programs.gui.browsers.edge = {
        enable = lib.mkEnableOption "edge";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.microsoft-edge
        ];
      };
    };

  userModule = {
    programs.gui.browsers.edge =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.microsoft-edge
        ];
      };
  };

  homeManagerModule = {
    programs.gui.browsers.edge =
      { }:
      { username }:
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.microsoft-edge
        ];
      };
  };
}
