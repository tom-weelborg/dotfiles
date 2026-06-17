{ overrideFunction, pkgs, variables, ... }:
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
      users = {
        users = {
          ${variables.username} = {
            isNormalUser = true;
            displayname = variables.displayname;
            extraGroups = [
              "cdrom"
              "plugdev"
              "networkmanager"
              "video"
              "wheel"
            ];
          };
        };
      };
    };
  };

  imports = [
    ./hardware-configuration.nix
    ../../../../specialisations/work.nix
  ];
}
