{ overrideFunction, pkgs, ... }:
{
  modules = {
    system = {
      desktop-environments = {
        gnome = {
          enable = true;
        };
      };
      home-manager = {
        enable = true;
      };
    };
  };

  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 16*1024; # 16 GiB
  }];

  imports = [
    ./hardware-configuration.nix
    ../../../../specialisations/work.nix
  ];
}
