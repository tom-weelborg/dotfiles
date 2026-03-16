{ variables, ... }:
{
  home-manager.users.${variables.username} = { ... }:
  {
    programs.vivaldi = import ../_shared/chromium.nix;
  };
}
