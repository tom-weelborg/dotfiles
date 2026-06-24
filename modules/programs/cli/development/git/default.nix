{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.cli.development.git;
    in
    {
      options.modules.programs.cli.development.git = {
        enable = lib.mkEnableOption "git";
        name = lib.mkOption {
          type = lib.types.str;
        };
        email = lib.mkOption {
          type = lib.types.str;
        };
        extraSettings = lib.mkOption {
          type = lib.types.attrs;
          default = {};
        };
      };

      config = lib.mkIf cfg.enable {
        programs.git = {
          enable = true;
          config = lib.recursiveUpdate
            {
              init.defaultBranch = "main";
              user = {
                inherit
                  (cfg)
                  name
                  email
                  ;
              };
            }
            cfg.extraSettings;
        };
      };
    };

  userModule = { name, email, extraSettings ? {} }:
    { username }:
    { lib, ... }:
    {
      home-manager.users.${username} = { ... }:
      {
        programs.git = {
          enable = true;
          settings = lib.recursiveUpdate
            {
              init.defaultBranch = "main";
              user = {
                inherit
                  name
                  email
                  ;
              };
            }
            extraSettings;
        };
      };
    };
}
