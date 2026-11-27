{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "media"
      "pinta"
    ];
    enableOptionDescription = "pinta";
    packageName = "pinta";
  }
  args
