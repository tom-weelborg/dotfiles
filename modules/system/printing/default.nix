{ lib, mkModule, ... }@args:
mkModule
  {
    modulePath = [
      "system"
      "printing"
    ];
    systemModule = {
      options = {
        enable = lib.mkEnableOption "printing";
      };
      mkConfig = { cfg }:
        lib.mkIf cfg.enable
        {
          services.printing = {
            enable = true;
          };
        };
    };
  }
  args
