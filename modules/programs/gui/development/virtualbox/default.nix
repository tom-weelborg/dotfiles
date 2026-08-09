{
  systemModule = { config, lib, ... }:
    let
      cfg = config.modules.programs.gui.development.virtualbox;
    in
    {
      options.modules.programs.gui.development.virtualbox = {
        enable = lib.mkEnableOption "virtualbox";
      };

      config = lib.mkIf cfg.enable {
        virtualisation.virtualbox.host = {
          enable = true;
          enableExtensionPack = true;
        };
      };
    };

  userModule = {
    programs.gui.development.virtualbox =
      { }:
      { username }:
      { lib, ... }:
      {
        users.extraGroups.vboxusers.members = lib.mkAfter [ username ];
      };
  };
}
