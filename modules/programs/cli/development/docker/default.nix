{ lib, mkModule, ... }@args:
let
  enableOptionDescription = "docker";
in
mkModule
  {
    modulePath = [
      "programs"
      "cli"
      "development"
      "docker"
    ];
    systemModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
      };
      mkConfig = { cfg }:
        lib.mkIf cfg.enable
        {
          virtualisation.docker = {
            enable = true;
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
          users.users.${username}.extraGroups = lib.mkAfter [
            "docker"
          ];
        };
    };
  }
  args
