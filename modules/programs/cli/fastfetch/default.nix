{ variables, ... }:
{
  home-manager.users.${variables.username} = { ... }:
  {
    programs.fastfetch = {
      enable = true;
    };
  };
}
