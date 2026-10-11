{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "cli"
      "cryptography"
      "ssh-to-age"
    ];
    enableOptionDescription = "ssh-to-age";
    packageName = "ssh-to-age";
  }
  args

