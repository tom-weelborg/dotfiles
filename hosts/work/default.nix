{ pkgs, ... }:
{
  imports = [
    ../../modules/mumble
    ../../modules/openvpn
    ../../modules/teams
  ];
}
