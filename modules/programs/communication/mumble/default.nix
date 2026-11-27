{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "communication"
      "mumble"
    ];
    enableOptionDescription = "mumble";
    packageName = "mumble";
  }
  args
