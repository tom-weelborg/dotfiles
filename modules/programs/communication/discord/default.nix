{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "communication"
      "discord"
    ];
    enableOptionDescription = "discord";
    packageName = "discord";
  }
  args
