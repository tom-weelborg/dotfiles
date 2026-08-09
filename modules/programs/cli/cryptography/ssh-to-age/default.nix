{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.cli.cryptography.ssh-to-age;
    in
    {
      options.modules.programs.cli.cryptography.ssh-to-age = {
        enable = lib.mkEnableOption "ssh-to-age";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.ssh-to-age
        ];
      };
    };

  userModule = {
    programs.cli.cryptography.ssh-to-age =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.ssh-to-age
        ];
      };
  };
}
