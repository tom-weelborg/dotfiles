{ pkgs, variables, ... }:
{
  imports = [
    ./docker
    ./git
    ./home
    ./jetbrains
    ./keepassxc
    ./obs
    ./obsidian
    ./pinta
    ./shotcut
    ./vlc
    ./vscodium
  ];
}
