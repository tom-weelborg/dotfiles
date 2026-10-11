{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gui"
      "media"
      "obs"
    ];
    enableOptionDescription = "obs";
    packageName = "obs-studio";
  }
  args
