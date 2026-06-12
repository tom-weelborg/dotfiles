{ defaultExtensionsFunction, extensionsTypeFunction, program, programConfig, ... }:
{
  options = { lib, pkgs, ... }:
    {
      defaultExtensions = lib.mkOption {
        type = lib.types.listOf (extensionsTypeFunction { inherit lib; });
        default = defaultExtensionsFunction { inherit pkgs; };
      };
      extraExtensions = lib.mkOption {
        type = lib.types.listOf (extensionsTypeFunction { inherit lib; });
        default = [];
      };
    };

  module = { lib, moduleConfig, pkgs, variables, ... }:
    {
      home-manager.users.${variables.username} = { config, ... }:
      {
        programs.${program} = programConfig {
          inherit
            lib
            moduleConfig
            pkgs
            variables
            ;
          xdg = config.xdg;
        };
      };
    };
}
