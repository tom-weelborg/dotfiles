{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "gui"
      "obsidian"
    ];
    enableOptionDescription = "obsidian";
    packageName = "obsidian";
  }
  args
