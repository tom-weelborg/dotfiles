{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.cli.openssh.server;
    in
    {
      options.modules.programs.cli.openssh.server = {
        enable = lib.mkEnableOption "openssh-server";
        openFirewall = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        authorizedKeysFiles = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [];
        };
        authorizedKeysInHomedir = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        settings = {
          AllowUsers = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [];
          };
          KbdInteractiveAuthentication = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };
          PasswordAuthentication = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };
          PermitRootLogin = lib.mkOption {
            type = lib.types.str;
            default = "no";
          };
        };
      };

      config = lib.mkIf cfg.enable {
        services.openssh = {
          enable = true;
          openFirewall = cfg.openFirewall;
          authorizedKeysFiles = cfg.authorizedKeysFiles;
          authorizedKeysInHomedir = cfg.authorizedKeysInHomedir;
          settings = {
            AllowUsers = cfg.settings.AllowUsers;
            KbdInteractiveAuthentication = cfg.settings.KbdInteractiveAuthentication;
            PasswordAuthentication = cfg.settings.PasswordAuthentication;
            PermitRootLogin = cfg.settings.PermitRootLogin;
          };
        };
      };
    };
}
