{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.media.pinta;
    in
    {
      options.modules.programs.gui.media.pinta = {
        enable = lib.mkEnableOption "pinta";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.pinta
        ];
      };
    };

  userModule = { }:
    { username }:
    { lib, pkgs, ... }:
    {
      users.users.${username}.packages = lib.mkAfter [
        pkgs.pinta
      ];
    };
}
