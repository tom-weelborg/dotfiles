{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "cli"
      "development"
      "claude-code"
    ];
    enableOptionDescription = "claude-code";
    packageName = "claude-code";
  }
  args


