{ lib, users }:
let
  mkModule = import ./mkModule.nix { inherit lib users; };

  mkStandardModule =
    {
      modulePath ? [],
      enableOptionDescription ? "",
      packageName ? ""
    }:
    { pkgs, ... }@nixosArgs:
    mkModule
      {
        inherit modulePath;
        systemModule = {
          options = {
            enable = lib.mkEnableOption enableOptionDescription;
          };
          mkConfig = { cfg }:
            lib.mkIf cfg.enable
            {
              environment.systemPackages = [
                pkgs.${packageName}
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
                pkgs.${packageName}
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
              home.packages = [
                pkgs.${packageName}
              ];
            };
        };
      }
      nixosArgs
    ;
in
mkStandardModule
