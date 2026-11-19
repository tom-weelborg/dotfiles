{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gui"
      "gaming"
      "mgba"
    ];
    enableOptionDescription = "mgba";
    packageName = "mgba";
  }
  args
