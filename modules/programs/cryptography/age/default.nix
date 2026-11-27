{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "cryptography"
      "age"
    ];
    enableOptionDescription = "age";
    packageName = "age";
  }
  args
