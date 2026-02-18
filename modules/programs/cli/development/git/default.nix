{
  options = lib:
    {
      extraSettings = lib.mkOption {
        type = lib.types.attrs;
        default = {};
      };
    };

  module = { lib, moduleConfig, variables, ... }:
    {
      home-manager.users.${variables.username} = { ... }:
      {
        programs.git = {
          enable = true;
          settings = lib.recursiveUpdate
            {
              init.defaultBranch = "main";
              user = {
                name = variables.git.name;
                email = variables.git.email;
              };
            }
            moduleConfig.extraSettings;
        };
      };
    };
}
