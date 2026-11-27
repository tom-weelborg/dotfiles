{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "media"
      "spotify"
    ];
    enableOptionDescription = "spotify";
    packageName = "spotify";
  }
  args
