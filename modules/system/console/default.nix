{
  systemModule = { config, lib, ... }:
    let
      cfg = config.modules.system.console;
    in
    {
      options.modules.system.console = {
        keyMap = lib.mkOption {
          type = lib.types.str;
          default = "de";
        };
      };

      config = {
        console.keyMap = cfg.keyMap;
      };
    };
}
