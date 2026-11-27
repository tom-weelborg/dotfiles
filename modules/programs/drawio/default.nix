{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "drawio"
    ];
    enableOptionDescription = "drawio";
    packageName = "drawio";
  }
  args
