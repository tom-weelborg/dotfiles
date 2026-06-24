{
  systemModule = { config, lib, ... }:
    let
      cfg = config.modules.programs.gui.syncthing;
    in
    {
      options.modules.programs.gui.syncthing = {
        enable = lib.mkEnableOption "syncthing";
      };

      config = lib.mkIf cfg.enable {
        services.syncthing = {
          enable = true;
          openDefaultPorts = true;
        };
      };
    };

  userModule = { }:
    { username }:
    { ... }:
    {
      home-manager.users.${username} = { ... }:
      {
        services.syncthing.enable = true;
      };
    };
}
