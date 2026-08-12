{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.media.audacity;
    in
    {
      options.modules.programs.gui.media.audacity = {
        enable = lib.mkEnableOption "audacity";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.audacity
        ];
      };
    };

  userModule = {
    programs.gui.media.audacity =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.audacity
        ];
      };
  };

  homeManagerModule = {
    programs.gui.media.audacity =
      { }:
      { username }:
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.audacity
        ];
      };
  };
}
