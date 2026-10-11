{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gui"
      "communication"
      "discord"
    ];
    enableOptionDescription = "discord";
    packageName = "discord";
  }
  args
