{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "browser-utils"
      "chromedriver"
    ];
    enableOptionDescription = "chromedriver";
    packageName = "chromedriver";
  }
  args
