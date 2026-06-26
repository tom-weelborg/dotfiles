{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.system.kernel;
    in
    {
      options.modules.system.kernel = {
        modules = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [ ];
        };
        packages = lib.mkOption {
          type = lib.types.raw;
          default = pkgs.linuxPackages_latest;
        };
      };

      config = {
        boot = {
          kernelModules = lib.mkAfter cfg.modules;

          kernelPackages = cfg.packages;
        };
      };
    };
}
