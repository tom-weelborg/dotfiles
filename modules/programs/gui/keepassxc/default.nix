{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.keepassxc;
    in
    {
      options.modules.programs.gui.keepassxc = {
        enable = lib.mkEnableOption "keepassxc";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.keepassxc
        ];
      };
    };

  userModule = { }:
    { username }:
    { lib, pkgs, ... }:
    {
      users.users.${username}.packages = lib.mkAfter [
        pkgs.keepassxc
      ];
    };
}
