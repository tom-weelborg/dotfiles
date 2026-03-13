{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.soapui
  ];
}
