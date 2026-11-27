{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gaming"
      "sl"
    ];
    enableOptionDescription = "sl";
    packageName = "sl";
  }
  args
