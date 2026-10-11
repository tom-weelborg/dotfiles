{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gui"
      "media"
      "spotify"
    ];
    enableOptionDescription = "spotify";
    packageName = "spotify";
  }
  args
