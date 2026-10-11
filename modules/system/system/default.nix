{ lib, mkModule, ... }@args:
mkModule
  {
    modulePath = [
      "system"
      "system"
    ];
    systemModule = {
      options = {
        stateVersion = lib.mkOption {
          type = lib.types.str;
          default = "25.05";
        };
      };
      mkConfig = { cfg }:
        {
          system.stateVersion = cfg.stateVersion;
        };
    };
  }
  args
