{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "obsidian"
    ];
    enableOptionDescription = "obsidian";
    packageName = "obsidian";
  }
  args
