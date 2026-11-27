{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "development"
      "mongodb-compass"
    ];
    enableOptionDescription = "mongodb-compass";
    packageName = "mongodb-compass";
  }
  args
