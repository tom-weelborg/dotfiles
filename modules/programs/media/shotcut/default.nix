{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "media"
      "shotcut"
    ];
    enableOptionDescription = "shotcut";
    packageName = "shotcut";
  }
  args
