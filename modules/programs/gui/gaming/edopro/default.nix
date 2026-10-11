{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gui"
      "gaming"
      "edopro"
    ];
    enableOptionDescription = "edopro";
    packageName = "edopro";
  }
  args
