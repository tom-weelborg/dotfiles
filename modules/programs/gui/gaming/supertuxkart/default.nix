{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gui"
      "gaming"
      "supertuxkart"
    ];
    enableOptionDescription = "supertuxkart";
    packageName = "supertuxkart";
  }
  args
