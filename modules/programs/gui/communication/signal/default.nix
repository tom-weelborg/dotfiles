{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.communication.signal;
    in
    {
      options.modules.programs.gui.communication.signal = {
        enable = lib.mkEnableOption "signal";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.signal-desktop
        ];
      };
    };

  userModule = { }:
    { username }:
    { lib, pkgs, ... }:
    {
      users.users.${username}.packages = lib.mkAfter [
        pkgs.signal-desktop
      ];
    };
}
