{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gui"
      "media"
      "shotcut"
    ];
    enableOptionDescription = "shotcut";
    packageName = "shotcut";
  }
  args
