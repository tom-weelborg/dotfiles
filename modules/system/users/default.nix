{
  options = { lib, ... }:
    {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };
      users = lib.mkOption {
        type = lib.types.attrsOf (lib.types.submodule {
          options = {
            isNormalUser = lib.mkOption {
              type = lib.types.bool;
            };

            displayname = lib.mkOption {
              type = lib.types.str;
            };

            extraGroups = lib.mkOption {
              type = lib.types.listOf lib.types.str;
            };
          };
        });
        default = {};
      };
    };

  module = { lib, moduleConfig, ... }:
    {
      users.users = lib.mapAttrs
        (name: value: {
          isNormalUser = value.isNormalUser;
          description = value.displayname;
          extraGroups = value.extraGroups;
        })
        moduleConfig.users
        ;
    };
}
