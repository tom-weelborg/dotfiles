{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "cli"
      "gaming"
      "fortune"
    ];
    enableOptionDescription = "fortune";
    packageName = "fortune";
  }
  args
