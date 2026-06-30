{
  systemModule = { config, lib, ... }:
    let
      cfg = config.modules.system.printing;
    in
    {
      options.modules.system.printing = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
      };

      config = {
        services.printing.enable = cfg.enable;
      };
    };
}
