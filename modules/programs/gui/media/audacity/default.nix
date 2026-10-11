{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gui"
      "media"
      "audacity"
    ];
    enableOptionDescription = "audacity";
    packageName = "audacity";
  }
  args
