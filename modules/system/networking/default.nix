{ lib, mkModule, ... }@args:
mkModule
  {
    modulePath = [
      "system"
      "networking"
    ];
    systemModule = {
      options = {
        hostId = lib.mkOption {
          type = lib.types.nullOr lib.types.str;
          default = null;
        };

        hostName = lib.mkOption {
          type = lib.types.str;
          default = "nixos";
        };

        networkmanager = {
          enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
          };
        };
      };
      mkConfig = { cfg }:
        {
          networking.hostId = cfg.hostId;

          networking.hostName = cfg.hostName;

          networking.networkmanager = {
            enable = cfg.networkmanager.enable;
          };
        };
    };
  }
  args
