{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gui"
      "communication"
      "mumble"
    ];
    enableOptionDescription = "mumble";
    packageName = "mumble";
  }
  args

