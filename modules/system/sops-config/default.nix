{ lib, mkModule, ... }@args:
mkModule
  {
    modulePath = [
      "system"
      "sops-config"
    ];
    systemModule = {
      options = {
        keyFile = lib.mkOption {
          type = lib.types.str;
        };
        sshKeyPaths = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [];
        };
        generateKey = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
      };
      mkConfig = { cfg }:
        {
          sops = {
            age = {
              keyFile = cfg.keyFile;
              sshKeyPaths = cfg.sshKeyPaths;
              generateKey = cfg.generateKey;
            };
          };
        };
    };
    userModule = {
      options = {
        enable = lib.mkEnableOption "sops-config";
        secrets = lib.mkOption {
          type = lib.types.attrs;
          default = {};
        };
      };
      mkConfig = { cfg, username }:
        lib.mkIf cfg.enable
        {
          sops = {
            secrets = builtins.mapAttrs
              (_: value:
                {
                  owner = username;
                }
                //
                value
              )
              cfg.secrets
              ;
          };
        };
    };
  }
  args
