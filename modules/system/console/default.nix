{ lib, mkModule, ... }@args:
mkModule
  {
    modulePath = [
      "system"
      "console"
    ];
    systemModule = {
      options = {
        keyMap = lib.mkOption {
          type = lib.types.str;
          default = "de";
        };
      };
      mkConfig = { cfg }:
        {
          console.keyMap = cfg.keyMap;
        };
    };
  }
  args
