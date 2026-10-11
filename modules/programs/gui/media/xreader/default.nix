{ lib, mkModule, pkgs, ... }@args:
let
  enableOptionDescription = "xreader";
in
mkModule
  {
    modulePath = [
      "programs"
      "gui"
      "media"
      "xreader"
    ];
    systemModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
      };
      mkConfig = { cfg }:
        lib.mkIf cfg.enable
        {
          environment.systemPackages = [
            pkgs.xreader
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
            pkgs.xreader
          ];
        };
    };
    homeManagerModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
      };
      mkConfig = { cfg, username }: { pkgs, ... }@homeManagerArgs:
        lib.mkIf cfg.enable
        {
          home.packages = (lib.optionals pkgs.stdenv.isLinux [
            pkgs.xreader
          ]);
        };
    };
  }
  args
