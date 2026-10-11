{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gui"
      "development"
      "bruno"
    ];
    enableOptionDescription = "bruno";
    packageName = "bruno";
  }
  args
