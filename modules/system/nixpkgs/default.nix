{ lib, mkModule, ... }@args:
mkModule
  {
    modulePath = [
      "system"
      "nixpkgs"
    ];
    systemModule = {
      options = {
        allowUnfree = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
      };
      mkConfig = { cfg }:
        {
          nixpkgs.config.allowUnfree = cfg.allowUnfree;
        };
    };
  }
  args
