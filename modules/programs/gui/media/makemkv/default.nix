{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.media.makemkv;
    in
    {
      options.modules.programs.gui.media.makemkv = {
        enable = lib.mkEnableOption "makemkv";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.makemkv
        ];
      };
    };

  userModule = {
    programs.gui.media.makemkv =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.makemkv
        ];
      };
  };

  homeManagerModule = {
    programs.gui.media.makemkv =
      { }:
      { username }:
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.makemkv
        ];
      };
  };
}
