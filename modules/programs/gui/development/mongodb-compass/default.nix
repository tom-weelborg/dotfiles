{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gui"
      "development"
      "mongodb-compass"
    ];
    enableOptionDescription = "mongodb-compass";
    packageName = "mongodb-compass";
  }
  args
