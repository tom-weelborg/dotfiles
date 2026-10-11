{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "cli"
      "media"
      "imagemagick"
    ];
    enableOptionDescription = "imagemagick";
    packageName = "imagemagick";
  }
  args
