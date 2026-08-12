{
  systemModule = { config, lib, ... }:
    let
      cfg = config.modules.system.printing;
    in
    {
      options.modules.system.printing = {
        enable = lib.mkEnableOption "printing";
      };

      config = {
        services.printing.enable = cfg.enable;
      };
    };
}
