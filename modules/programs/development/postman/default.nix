{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "development"
      "postman"
    ];
    enableOptionDescription = "postman";
    packageName = "postman";
  }
  args
