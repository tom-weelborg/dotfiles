{ pkgs, variables, ... }:
{
  imports = [
    ./docker
    ./fastfetch
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
