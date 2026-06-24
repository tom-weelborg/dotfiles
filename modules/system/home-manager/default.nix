{
  systemModule = { config, lib, ... }:
    let
      cfg = config.modules.system.home-manager;
    in
    {
      options.modules.system.home-manager = {
        enable = lib.mkEnableOption "home-manager";
      };

      config = lib.mkIf cfg.enable {
        home-manager.useGlobalPkgs = true;
      };
    };

  userModule = { stateVersion ? "25.11" }:
    { username }:
    { ... }:
    {
      home-manager.users.${username} = { ... }:
        {
          home.stateVersion = stateVersion;
        };
    };
}
