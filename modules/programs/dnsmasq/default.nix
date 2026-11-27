{ lib, mkModule, ... }@args:
let
  enableOptionDescription = "dnsmasq";
in
mkModule
  {
    modulePath = [
      "programs"
      "dnsmasq"
    ];
    systemModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
        settings = lib.mkOption {
          type = lib.types.attrs;
          default = {};
        };
      };
      mkConfig = { cfg }:
        lib.mkIf cfg.enable
        {
          services.dnsmasq = {
            enable = true;
            settings = cfg.settings;
          };
        };
    };
  }
  args
