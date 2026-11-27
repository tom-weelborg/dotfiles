{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "cryptography"
      "sops"
    ];
    enableOptionDescription = "sops";
    packageName = "sops";
  }
  args
