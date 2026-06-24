{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.media.obs;
    in
    {
      options.modules.programs.gui.media.obs = {
        enable = lib.mkEnableOption "obs";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.obs-studio
        ];
      };
    };

  userModule = { }:
    { username }:
    { lib, pkgs, ... }:
    {
      users.users.${username}.packages = lib.mkAfter [
        pkgs.obs-studio
      ];
    };
}
