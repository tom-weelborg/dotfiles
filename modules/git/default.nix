{ variables, ... }:
{
  home-manager.users.${variables.username} = { ... }:
  {
    programs.git = {
      enable = true;
      settings = {
        init.defaultBranch = "main";
        user = {
          name = variables.git.name;
          email = variables.git.email;
        };
      };
    };
  };
}
