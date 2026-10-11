{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gui"
      "keepassxc"
    ];
    enableOptionDescription = "keepassxc";
    packageName = "keepassxc";
  }
  args
