{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.mumble
  ];
}
