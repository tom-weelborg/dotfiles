{
  systemModule = { config, lib, ... }:
    let
      cfg = config.modules.system.localization.time;
    in
    {
      options.modules.system.localization.time = {
        timeZone = lib.mkOption {
          type = lib.types.str;
          default = "Europe/Berlin";
        };
      };

      config = {
        time.timeZone = cfg.timeZone;
      };
    };
}
