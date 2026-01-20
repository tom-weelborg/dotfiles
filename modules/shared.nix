{ pkgs, variables, ... }:
{
  imports = [
    ./git
    ./home
    ./jetbrains
    ./obsidian
    ./vscodium
  ];
}
