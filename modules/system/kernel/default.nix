{ lib, mkModule, pkgs, ... }@args:
mkModule
  {
    modulePath = [
      "system"
      "kernel"
    ];
    systemModule = {
      options = {
        modules = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [ ];
        };
        packages = lib.mkOption {
          type = lib.types.raw;
          default = pkgs.linuxPackages_latest;
        };
      };
      mkConfig = { cfg }:
        {
          boot = {
            kernelModules = lib.mkAfter cfg.modules;

            kernelPackages = cfg.packages;
          };
        };
    };
  }
  args
