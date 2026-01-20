{ pkgs, variables, ... }:
{
  imports = [
    ./git
    ./home
    ./jetbrains
    ./vscodium
  ];
}
