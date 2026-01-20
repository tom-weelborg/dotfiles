{ pkgs, variables, ... }:
{
  imports = [
    ./docker
    ./git
    ./home
    ./jetbrains
    ./obsidian
    ./vscodium
  ];
}
