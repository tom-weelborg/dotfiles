{ lib, mkModule, pkgs, ... }@args:
let
  enableOptionDescription = "onedrive";
in
mkModule
  {
    modulePath = [
      "programs"
      "gui"
      "microsoft"
      "onedrive"
    ];
    systemModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
      };
      mkConfig = { cfg }:
        lib.mkIf cfg.enable
        {
          services.onedrive = {
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
          users.users.${username}.packages = lib.mkAfter [
            pkgs.onedrive
          ];
        };
    };
    homeManagerModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
      };
      mkConfig = { cfg, username }: { ... }@homeManagerArgs:
        lib.mkIf cfg.enable
        {
          programs.onedrive = {
            enable = true;
          };
        };
    };
  }
  args
