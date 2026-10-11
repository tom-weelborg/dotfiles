{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gui"
      "development"
      "dbeaver"
    ];
    enableOptionDescription = "dbeaver";
    packageName = "dbeaver-bin";
  }
  args
