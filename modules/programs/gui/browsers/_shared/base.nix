{ extraExtensionsTypeFunction, program, programConfig, ... }:
{
  options = lib:
    {
      extraExtensions = lib.mkOption {
        type = lib.types.listOf (extraExtensionsTypeFunction { inherit lib; });
        default = [];
      };
    };

  module = { moduleConfig, pkgs, variables, ... }:
    {
      home-manager.users.${variables.username} = { ... }:
      {
        programs.${program} = programConfig {
          inherit
            moduleConfig
            pkgs
            variables
            ;
        };
      };
    };
}
