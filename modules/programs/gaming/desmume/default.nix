{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gaming"
      "desmume"
    ];
    enableOptionDescription = "desmume";
    packageName = "desmume";
  }
  args
