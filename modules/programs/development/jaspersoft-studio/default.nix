{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "development"
      "jaspersoft-studio"
    ];
    enableOptionDescription = "jaspersoft-studio";
    packageName = "jaspersoft-studio";
  }
  args
