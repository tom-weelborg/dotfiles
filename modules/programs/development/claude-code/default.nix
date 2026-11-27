{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "development"
      "claude-code"
    ];
    enableOptionDescription = "claude-code";
    packageName = "claude-code";
  }
  args
