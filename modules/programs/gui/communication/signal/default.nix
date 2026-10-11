{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gui"
      "communication"
      "signal"
    ];
    enableOptionDescription = "signal";
    packageName = "signal-desktop";
  }
  args
