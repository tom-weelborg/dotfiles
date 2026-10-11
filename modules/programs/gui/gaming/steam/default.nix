{ lib, mkModule, ... }@args:
mkModule
  {
    modulePath = [
      "programs"
      "gui"
      "gaming"
      "steam"
    ];
    systemModule = {
      options = {
        enable = lib.mkEnableOption "steam";
      };
      mkConfig = { cfg }:
        lib.mkIf cfg.enable
        {
          programs.steam = {
            enable = true;
            remotePlay.openFirewall = true;
          };
        };
    };
  }
  args
