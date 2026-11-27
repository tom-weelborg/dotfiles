{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gaming"
      "mgba"
    ];
    enableOptionDescription = "mgba";
    packageName = "mgba";
  }
  args
