{ lib, mkModule, ... }@args:
let
  enableOptionDescription = "virtualbox";
in
mkModule
  {
    modulePath = [
      "programs"
      "gui"
      "development"
      "virtualbox"
    ];
    systemModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
      };
      mkConfig = { cfg }:
        lib.mkIf cfg.enable
        {
          virtualisation.virtualbox.host = {
            enable = true;
            enableExtensionPack = true;
          };
        };
    };
    userModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
      };
      mkConfig = { cfg, username }:
        lib.mkIf cfg.enable
        {
          users.extraGroups.vboxusers.members = lib.mkAfter [
            username
          ];
        };
    };
  }
  args
