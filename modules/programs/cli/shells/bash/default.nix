{ lib, mkModule, pkgs, ... }@args:
let
  enableOptionDescription = "bash";
in
mkModule
  {
    modulePath = [
      "programs"
      "cli"
      "shells"
      "bash"
    ];
    systemModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
        shellAliases = lib.mkOption {
          type = lib.types.attrs;
          default = {
            cp = "cp -i";
            ln = "ln -i";
            mv = "mv -i";
            rm = "rm -i";
          };
        };
      };
      mkConfig = { cfg }:
        lib.mkIf cfg.enable
        {
          programs.bash = {
            enable = true;
            shellAliases = cfg.shellAliases;
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
            pkgs.bash
          ];
        };
    };
    homeManagerModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
        shellAliases = lib.mkOption {
          type = lib.types.attrs;
          default = {};
        };
      };
      mkConfig = { cfg, username }: { ... }@homeManagerArgs:
        lib.mkIf cfg.enable
        {
          programs.bash = {
            enable = true;
            shellAliases = cfg.shellAliases;
          };
        };
    };
  }
  args
