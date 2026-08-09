{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.obsidian;
    in
    {
      options.modules.programs.gui.obsidian = {
        enable = lib.mkEnableOption "obsidian";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.obsidian
        ];
      };
    };

  userModule = {
    programs.gui.obsidian =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.obsidian
        ];
      };
  };
}
