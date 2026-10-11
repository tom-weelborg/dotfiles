{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gui"
      "gaming"
      "desmume"
    ];
    enableOptionDescription = "desmume";
    packageName = "desmume";
  }
  args
