{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.media.spotify;
    in
    {
      options.modules.programs.gui.media.spotify = {
        enable = lib.mkEnableOption "spotify";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.spotify
        ];
      };
    };

  userModule = { }:
    { username }:
    { lib, pkgs, ... }:
    {
      users.users.${username}.packages = lib.mkAfter [
        pkgs.spotify
      ];
    };
}
