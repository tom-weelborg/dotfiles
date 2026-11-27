{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "media"
      "vlc"
    ];
    enableOptionDescription = "vlc";
    packageName = "vlc";
  }
  args
