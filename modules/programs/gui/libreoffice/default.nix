{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gui"
      "libreoffice"
    ];
    enableOptionDescription = "libreoffice";
    packageName = "libreoffice";
  }
  args
