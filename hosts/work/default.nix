{ pkgs, ... }:
{
  imports = [
    ../../modules/microsoft
    ../../modules/mumble
    ../../modules/openvpn
  ];
}
