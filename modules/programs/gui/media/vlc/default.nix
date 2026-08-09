{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.media.vlc;
    in
    {
      options.modules.programs.gui.media.vlc = {
        enable = lib.mkEnableOption "vlc";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.vlc
        ];
      };
    };

  userModule = {
    programs.gui.media.vlc =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.vlc
        ];
      };
  };
}
