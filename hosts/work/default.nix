{ pkgs, ... }:
{
  imports = [
    ../../modules/git/work.nix
    ../../modules/microsoft
    ../../modules/mumble
    ../../modules/openvpn
  ];
}
