{ pkgs, variables, ... }:
{
  imports = [
    ./docker
    ./git
    ./gnome
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
