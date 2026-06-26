{
  systemModule = { config, lib, ... }:
    let
      cfg = config.modules.system.nix;
    in
    {
      options.modules.system.nix = {
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

      config = lib.mkMerge [
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
