{ pkgs, variables, ... }:
{
  imports = [
    ./docker
    ./firefox
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
