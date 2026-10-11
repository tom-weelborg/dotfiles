{ lib, mkModule, pkgs, ... }@args:
let
  enableOptionDescription = "syncthing";
in
mkModule
  {
    modulePath = [
      "programs"
      "gui"
      "syncthing"
    ];
    systemModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
      };
      mkConfig = { cfg }:
        lib.mkIf cfg.enable
        {
          services.syncthing = {
            enable = true;
            openDefaultPorts = true;
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
            pkgs.syncthing
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
          services.syncthing = {
            enable = true;
          };
        };
    };
  }
  args
