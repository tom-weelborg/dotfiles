{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gui"
      "media"
      "vlc"
    ];
    enableOptionDescription = "vlc";
    packageName = "vlc";
  }
  args
