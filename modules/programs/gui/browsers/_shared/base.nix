{ extraExtensionsTypeFunction, program, programConfig, ... }:
{
  options = lib:
    {
      extraExtensions = lib.mkOption {
        type = lib.types.listOf (extraExtensionsTypeFunction { inherit lib; });
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
