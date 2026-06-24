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

  userModule = { }:
    { username }:
    { lib, pkgs, ... }:
    {
      users.users.${username}.packages = lib.mkAfter [
        pkgs.audacity
      ];
    };
}
