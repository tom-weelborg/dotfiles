{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gui"
      "browsers"
      "edge"
    ];
    enableOptionDescription = "microsoft-edge";
    packageName = "microsoft-edge";
  }
  args
