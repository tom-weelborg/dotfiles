{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.microsoft-edge
  ];
}
