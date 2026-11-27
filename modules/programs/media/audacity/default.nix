{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "media"
      "audacity"
    ];
    enableOptionDescription = "audacity";
    packageName = "audacity";
  }
  args
