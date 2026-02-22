{ variables, ... }:
{
  home-manager.useGlobalPkgs = true;

  home-manager.users.${variables.username} = { ... }:
    {
      home.stateVersion = "25.11";
    };
}