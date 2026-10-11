{ lib, mkModule, pkgs, ... }@args:
let
  enableOptionDescription = "teams";
in
mkModule
  {
    modulePath = [
      "programs"
      "gui"
      "microsoft"
      "teams"
    ];
    systemModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
      };
      mkConfig = { cfg }:
        lib.mkIf cfg.enable
        {
          environment.systemPackages = [
            pkgs.teams-for-linux
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
            pkgs.teams-for-linux
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
          home.packages =
            (lib.optionals pkgs.stdenv.isDarwin [
              pkgs.teams
            ])
            ++
            (lib.optionals pkgs.stdenv.isLinux [
              pkgs.teams-for-linux
            ])
            ;
        };
    };
  }
  args
