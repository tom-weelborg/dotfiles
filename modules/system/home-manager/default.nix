{ lib, mkModule, ... }@args:
let
  enableOptionDescription = "home-manager";
in
mkModule
  {
    modulePath = [
      "system"
      "home-manager"
    ];
    systemModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
      };
      mkConfig = { cfg }:
        lib.mkIf cfg.enable
        {
          home-manager.useGlobalPkgs = true;
        };
    };
    homeManagerModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
        stateVersion = lib.mkOption {
          type = lib.types.str;
          default = "25.11";
        };
      };
      mkConfig = { cfg, username }: { ... }@homeManagerArgs:
        lib.mkIf cfg.enable
        {
          home.stateVersion = cfg.stateVersion;
        };
    };
  }
  args
