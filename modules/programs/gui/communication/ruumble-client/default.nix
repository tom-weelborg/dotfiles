{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gui"
      "communication"
      "ruumble-client"
    ];
    enableOptionDescription = "ruumble-client";
    packageName = "ruumble-client";
  }
  args

