{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.cli.cryptography.sops;
    in
    {
      options.modules.programs.cli.cryptography.sops = {
        enable = lib.mkEnableOption "sops";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.sops
        ];
      };
    };

  userModule = {
    programs.cli.cryptography.sops =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.sops
        ];
      };
  };
}
