{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "development"
      "bruno"
    ];
    enableOptionDescription = "bruno";
    packageName = "bruno";
  }
  args
