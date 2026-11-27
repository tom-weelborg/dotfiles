{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gaming"
      "cowsay"
    ];
    enableOptionDescription = "cowsay";
    packageName = "cowsay";
  }
  args
