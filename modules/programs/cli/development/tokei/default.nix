{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "cli"
      "development"
      "tokei"
    ];
    enableOptionDescription = "tokei";
    packageName = "tokei";
  }
  args
