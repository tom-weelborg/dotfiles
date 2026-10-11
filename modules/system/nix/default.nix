{ lib, mkModule, ... }@args:
mkModule
  {
    modulePath = [
      "system"
      "nix"
    ];
    systemModule = {
      options = {
        access-tokens-path = lib.mkOption {
          type = lib.types.nullOr lib.types.str;
          default = null;
        };
        experimental-features = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [
            "nix-command"
            "flakes"
          ];
        };
      };
      mkConfig = { cfg }:
        lib.mkMerge [
          {
            nix.settings = {
              experimental-features = cfg.experimental-features;
            };
          }
          (lib.mkIf (cfg.access-tokens-path != null) {
            nix.extraOptions = ''
              !include ${cfg.access-tokens-path}
            '';
          })
        ];
    };
  }
  args
