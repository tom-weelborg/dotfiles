{ lib, mkModule, ... }@args:
mkModule
  {
    modulePath = [
      "system"
      "localization"
      "time"
    ];
    systemModule = {
      options = {
        timeZone = lib.mkOption {
          type = lib.types.str;
          default = "Europe/Berlin";
        };
      };
      mkConfig = { cfg }:
        {
          time.timeZone = cfg.timeZone;
        };
    };
  }
  args
