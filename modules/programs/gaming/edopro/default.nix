{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gaming"
      "edopro"
    ];
    enableOptionDescription = "edopro";
    packageName = "edopro";
  }
  args
