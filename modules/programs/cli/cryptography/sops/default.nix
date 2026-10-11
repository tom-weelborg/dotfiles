{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "cli"
      "cryptography"
      "sops"
    ];
    enableOptionDescription = "sops";
    packageName = "sops";
  }
  args
