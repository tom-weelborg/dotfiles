{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "cli"
      "cryptography"
      "age"
    ];
    enableOptionDescription = "age";
    packageName = "age";
  }
  args
