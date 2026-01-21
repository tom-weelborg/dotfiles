{ pkgs, variables, ... }:
{
  imports = [
    ./docker
    ./git
    ./home
    ./jetbrains
    ./obs
    ./obsidian
    ./pinta
    ./shotcut
    ./vlc
    ./vscodium
  ];
}
