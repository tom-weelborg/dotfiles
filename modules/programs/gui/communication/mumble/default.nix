{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.communication.mumble;
    in
    {
      options.modules.programs.gui.communication.mumble = {
        enable = lib.mkEnableOption "mumble";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.mumble
        ];
      };
    };

  userModule = {
    programs.gui.communication.mumble =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.mumble
        ];
      };
  };

  homeManagerModule = {
    programs.gui.communication.mumble =
      { }:
      { username }:
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.mumble
        ];
      };
  };
}
