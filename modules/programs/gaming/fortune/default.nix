{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gaming"
      "fortune"
    ];
    enableOptionDescription = "fortune";
    packageName = "fortune";
  }
  args
