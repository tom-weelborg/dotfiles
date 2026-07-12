{
  systemModule = { config, lib, ... }:
    let
      cfg = config.modules.system.sops;
    in
    {
      options.modules.system.sops = {
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

      config = {
        sops = {
          age = {
            keyFile = cfg.keyFile;
            sshKeyPaths = cfg.sshKeyPaths;
            generateKey = cfg.generateKey;
          };
        };
      };
    };

  userModule = { secrets ? {} }:
    { username }:
    { ... }:
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
          secrets
          ;
      };
    };
}
