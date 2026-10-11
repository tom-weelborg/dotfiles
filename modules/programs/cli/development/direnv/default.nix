{ lib, mkModule, pkgs, ... }@args:
let
  enableOptionDescription = "direnv";
in
mkModule
  {
    modulePath = [
      "programs"
      "cli"
      "development"
      "direnv"
    ];
    systemModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
      };
      mkConfig = { cfg }:
        lib.mkIf cfg.enable
        {
          programs.direnv = {
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
            pkgs.direnv
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
          programs.direnv = {
            enable = true;
          };
        };
    };
  }
  args
