{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "cryptography"
      "ssh-to-age"
    ];
    enableOptionDescription = "ssh-to-age";
    packageName = "ssh-to-age";
  }
  args
