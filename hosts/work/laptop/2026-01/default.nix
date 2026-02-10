{ pkgs, ... }:
{
  imports = [
    ../../../../modules/displaylink
    ../../../../modules/git/work.nix
    ../../../../modules/microsoft
    ../../../../modules/mumble
    ../../../../modules/openvpn
  ];
}
