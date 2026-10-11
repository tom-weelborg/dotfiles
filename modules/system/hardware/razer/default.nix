{ lib, mkModule, pkgs, ... }@args:
let
  enableOptionDescription = "razer";
in
mkModule
  {
    modulePath = [
      "system"
      "hardware"
      "razer"
    ];
    systemModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
      };
      mkConfig = { cfg }:
        lib.mkIf cfg.enable
        {
          hardware.openrazer = {
            enable = true;
          };

          environment.systemPackages = with pkgs; [
            polychromatic
          ];
        };
    };
    userModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
      };
      mkConfig = { cfg, username }:
        lib.mkIf cfg.enable
        {
          hardware.openrazer = {
            users = lib.mkAfter [
              username
            ];
          };
        };
    };
  }
  args
