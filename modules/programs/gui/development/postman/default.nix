{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gui"
      "development"
      "postman"
    ];
    enableOptionDescription = "postman";
    packageName = "postman";
  }
  args
