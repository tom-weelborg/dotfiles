{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.cli.vpn.wireguard;
    in
    {
      options.modules.programs.cli.vpn.wireguard = {
        enable = lib.mkEnableOption "wireguard";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.wireguard-tools
        ];
      };
    };

  userModule = { }:
    { username }:
    { lib, pkgs, ... }:
    {
      users.users.${username}.packages = lib.mkAfter [
        pkgs.wireguard-tools
      ];
    };
}
