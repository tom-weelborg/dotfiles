{ lib, mkModule, pkgs, ... }@args:
let
  enableOptionDescription = "fastfetch";
in
mkModule
  {
    modulePath = [
      "programs"
      "cli"
      "fastfetch"
    ];
    systemModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
      };
      mkConfig = { cfg }:
        lib.mkIf cfg.enable
        {
          environment.systemPackages = [
            pkgs.fastfetch
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
          users.users.${username}.packages = lib.mkAfter [
            pkgs.fastfetch
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
          programs.fastfetch = {
            enable = true;
          };
        };
    };
  }
  args
