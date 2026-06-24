{
  systemModule = { config, lib, ... }:
    let
      cfg = config.modules.programs.gui.gaming.steam;
    in
    {
      options.modules.programs.gui.gaming.steam = {
        enable = lib.mkEnableOption "steam";
      };

      config = lib.mkIf cfg.enable {
        programs.steam = {
          enable = true;
          remotePlay.openFirewall = true;
        };
      };
    };
}
