{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.desmume
  ];
}
