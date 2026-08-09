{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.gaming.edopro;
    in
    {
      options.modules.programs.gui.gaming.edopro = {
        enable = lib.mkEnableOption "edopro";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.edopro
        ];
      };
    };

  userModule = {
    programs.gui.gaming.edopro =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.edopro
        ];
      };
  };
}
