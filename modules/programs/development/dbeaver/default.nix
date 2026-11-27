{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "development"
      "dbeaver"
    ];
    enableOptionDescription = "dbeaver";
    packageName = "dbeaver-bin";
  }
  args
