{ mkStandardModule, pkgs, ... }@args:
mkStandardModule
  {
    modulePath = [
      "programs"
      "vpn"
      "wireguard"
    ];
    enableOptionDescription = "wireguard-tools";
    packageName = "wireguard-tools";
  }
  args
