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
      };

      config = {
        sops = {
          age.keyFile = cfg.keyFile;
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
