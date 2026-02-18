{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.dbeaver-bin
  ];
}
