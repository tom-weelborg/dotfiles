{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "media"
      "obs"
    ];
    enableOptionDescription = "obs";
    packageName = "obs-studio";
  }
  args
