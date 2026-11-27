{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "browsers"
      "edge"
    ];
    enableOptionDescription = "microsoft-edge";
    packageName = "microsoft-edge";
  }
  args
