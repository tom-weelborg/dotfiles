{ lib, mkModule, ... }@args:
mkModule
  {
    modulePath = [
      "jellyfin"
      "server"
    ];
    systemModule = {
      options = {
        enable = lib.mkEnableOption "jellyfin-server";
        openFirewall = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
      };
      mkConfig = { cfg }:
        lib.mkIf cfg.enable
        {
          services.jellyfin = {
            enable = true;
            openFirewall = cfg.openFirewall;
          };
        };
    };
  }
  args
