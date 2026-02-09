{ pkgs, variables, ... }:
{
  imports = [
    ./docker
    ./git
    ./gnome
    ./home
    ./jetbrains
    ./keepassxc
    ./makemkv
    ./obs
    ./obsidian
    ./pinta
    ./shotcut
    ./vlc
    ./vscodium
  ];
}
