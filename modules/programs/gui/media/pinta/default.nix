{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gui"
      "media"
      "pinta"
    ];
    enableOptionDescription = "pinta";
    packageName = "pinta";
  }
  args
