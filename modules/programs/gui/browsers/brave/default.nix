{ variables, ... }:
{
  home-manager.users.${variables.username} = { ... }:
  {
    programs.brave = import ../_shared/chromium.nix;
  };
}
