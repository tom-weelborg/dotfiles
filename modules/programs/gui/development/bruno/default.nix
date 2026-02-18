{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.bruno
  ];
}
