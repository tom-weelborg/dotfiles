{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "cli"
      "gaming"
      "sl"
    ];
    enableOptionDescription = "sl";
    packageName = "sl";
  }
  args
