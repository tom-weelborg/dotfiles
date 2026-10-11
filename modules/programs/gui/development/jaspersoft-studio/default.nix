{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gui"
      "development"
      "jaspersoft-studio"
    ];
    enableOptionDescription = "jaspersoft-studio";
    packageName = "jaspersoft-studio";
  }
  args
