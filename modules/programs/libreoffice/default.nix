{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "libreoffice"
    ];
    enableOptionDescription = "libreoffice";
    packageName = "libreoffice";
  }
  args
