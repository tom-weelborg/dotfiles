{
  systemModule = { config, lib, ... }:
    let
      cfg = config.modules.jellyfin.server;
    in
    {
      options.modules.jellyfin.server = {
        enable = lib.mkEnableOption "jellyfin-server";
        openFirewall = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
      };

      config = {
        services.jellyfin = {
          enable = cfg.enable;
          openFirewall = cfg.openFirewall;
        };
      };
    };
}
