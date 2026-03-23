{ variables, ... }:
{
  home-manager.users.${variables.username} = { ... }:
  {
    programs.rclone = {
      enable = true;
    };
  };
}
