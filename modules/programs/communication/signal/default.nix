{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "communication"
      "signal"
    ];
    enableOptionDescription = "signal";
    packageName = "signal-desktop";
  }
  args
