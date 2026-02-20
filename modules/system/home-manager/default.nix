{ variables, ... }:
{
  home-manager.users.${variables.username} = { ... }:
    {
      home.stateVersion = "25.11";
    };
}