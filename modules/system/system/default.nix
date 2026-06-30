{
  systemModule = { config, lib, ... }:
    let
      cfg = config.modules.system.system;
    in
    {
      options.modules.system.system = {
        stateVersion = lib.mkOption {
          type = lib.types.str;
          default = "25.05";
        };
      };

      config = {
        system.stateVersion = cfg.stateVersion;
      };
    };
}
