{
  systemModule = { config, lib, ... }:
    let
      cfg = config.modules.system.networking;
    in
    {
      options.modules.system.networking = {
        hostName = lib.mkOption {
          type = lib.types.str;
          default = "nixos";
        };

        networkmanager = {
          enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
          };
        };
      };

      config = {
        networking.hostName = cfg.hostName;

        networking.networkmanager = {
          enable = cfg.networkmanager.enable;
        };
      };
    };
}
