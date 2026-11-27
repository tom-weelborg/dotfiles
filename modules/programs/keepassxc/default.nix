{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "keepassxc"
    ];
    enableOptionDescription = "keepassxc";
    packageName = "keepassxc";
  }
  args
