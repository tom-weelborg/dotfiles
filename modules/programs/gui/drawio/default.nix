{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.drawio;
    in
    {
      options.modules.programs.gui.drawio = {
        enable = lib.mkEnableOption "drawio";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.drawio
        ];
      };
    };

  userModule = { }:
    { username }:
    { lib, pkgs, ... }:
    {
      users.users.${username}.packages = lib.mkAfter [
        pkgs.drawio
      ];
    };
}
