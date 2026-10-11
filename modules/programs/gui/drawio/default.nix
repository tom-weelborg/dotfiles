{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gui"
      "drawio"
    ];
    enableOptionDescription = "drawio";
    packageName = "drawio";
  }
  args
