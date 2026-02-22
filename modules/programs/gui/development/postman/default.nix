{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.postman
  ];
}
