{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "communication"
      "ruumble-client"
    ];
    enableOptionDescription = "ruumble-client";
    packageName = "ruumble-client";
  }
  args
