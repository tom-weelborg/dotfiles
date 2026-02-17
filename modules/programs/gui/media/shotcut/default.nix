{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.shotcut
  ];
}
