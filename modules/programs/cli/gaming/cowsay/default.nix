{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "cli"
      "gaming"
      "cowsay"
    ];
    enableOptionDescription = "cowsay";
    packageName = "cowsay";
  }
  args
