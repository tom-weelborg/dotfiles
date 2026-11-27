{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "media"
      "imagemagick"
    ];
    enableOptionDescription = "imagemagick";
    packageName = "imagemagick";
  }
  args
