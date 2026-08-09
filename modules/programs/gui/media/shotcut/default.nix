{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.media.shotcut;
    in
    {
      options.modules.programs.gui.media.shotcut = {
        enable = lib.mkEnableOption "shotcut";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.shotcut
        ];
      };
    };

  userModule = {
    programs.gui.media.shotcut =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.shotcut
        ];
      };
  };
}
