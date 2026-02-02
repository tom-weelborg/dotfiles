{ variables, ... }:
{
  home-manager.users.${variables.username} = { ... }:
  {
    programs.git = {
      settings = {
        core = {
          autocrlf = "input";
          longpaths = true;
        };
        credential.helper = "manager";
        init.defaultBranch = "main";
        merge = {
          ff = false;
        };
        pull = {
          ff = "only";
          rebase = false;
        };
      };
    };
  };
}
