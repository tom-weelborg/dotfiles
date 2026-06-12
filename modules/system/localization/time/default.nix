{
  options = { lib, ... }:
    {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };

      timeZone = lib.mkOption {
        type = lib.types.str;
        default = "Europe/Berlin";
      };
    };

  module = { moduleConfig, ... }:
    {
      time.timeZone = moduleConfig.timeZone;
    };
}
