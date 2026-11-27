{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gaming"
      "supertuxkart"
    ];
    enableOptionDescription = "supertuxkart";
    packageName = "supertuxkart";
  }
  args
