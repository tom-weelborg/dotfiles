{ pkgs, variables, ... }:
{
  hardware.openrazer = {
    enable = true;
    users = [ variables.username ];
  };

  environment.systemPackages = with pkgs; [
    polychromatic
  ];
}
