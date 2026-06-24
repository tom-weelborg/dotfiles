{
  systemModule = { config, lib, ... }:
    let
      cfg = config.modules.programs.cli.development.docker;
    in
    {
      options.modules.programs.cli.development.docker = {
        enable = lib.mkEnableOption "docker";
      };

      config = lib.mkIf cfg.enable {
        virtualisation.docker.enable = true;
      };
    };

  userModule = { }:
    { username }:
    { lib, ... }:
    {
      users.users.${username}.extraGroups = lib.mkAfter [ "docker" ];
    };
}
