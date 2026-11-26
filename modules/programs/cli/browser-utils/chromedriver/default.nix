{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "cli"
      "browser-utils"
      "chromedriver"
    ];
    enableOptionDescription = "chromedriver";
    packageName = "chromedriver";
  }
  args
