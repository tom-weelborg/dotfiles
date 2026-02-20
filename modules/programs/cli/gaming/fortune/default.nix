{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.fortune
  ];
}
