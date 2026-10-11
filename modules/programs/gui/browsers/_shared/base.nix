{
  browserName,
  defaultExtensionsFunction,
  extensionsTypeFunction,
  programConfig,
  programName,
  programPackageName
}:
{ lib, mkModule, pkgs, ... }@args:
let
  enableOptionDescription = browserName;
in
mkModule
  {
    modulePath = [
      "programs"
      "gui"
      "browsers"
      browserName
    ];
    systemModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
      };
      mkConfig = { cfg }:
        lib.mkIf cfg.enable
        {
          environment.systemPackages = [
            pkgs.${programPackageName}
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
            pkgs.${programPackageName}
          ];
        };
    };
    homeManagerModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
        defaultExtensions = lib.mkOption {
          type = lib.types.nullOr (lib.types.listOf (extensionsTypeFunction {
            inherit lib;
          }));
          default = null;
        };
        extraExtensions = lib.mkOption {
          type = lib.types.listOf (extensionsTypeFunction {
            inherit lib;
          });
          default = [];
        };
      };
      mkConfig = { cfg, username }: { config, lib, pkgs, ... }@homeManagerArgs:
        let
          de =
            if cfg.defaultExtensions == null then
              defaultExtensionsFunction { inherit pkgs; }
            else
              cfg.defaultExtensions
            ;
        in
        lib.mkIf cfg.enable
        {
          programs.${programName} = programConfig {
            inherit lib;
            moduleConfig = {
              extensions = de ++ cfg.extraExtensions;
            };
            xdg = config.xdg;
          };
        };
    };
  }
  args
