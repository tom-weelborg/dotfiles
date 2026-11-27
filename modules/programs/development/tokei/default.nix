{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "development"
      "tokei"
    ];
    enableOptionDescription = "tokei";
    packageName = "tokei";
  }
  args
