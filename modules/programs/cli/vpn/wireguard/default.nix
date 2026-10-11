{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "cli"
      "vpn"
      "wireguard"
    ];
    enableOptionDescription = "wireguard-tools";
    packageName = "wireguard-tools";
  }
  args
