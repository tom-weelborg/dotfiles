{ pkgs, ... }:
{
  modules.firefox = {
    enable = true;
    extraExtensions = [
      pkgs.nur.repos.rycee.firefox-addons.requestly
    ];
  };

  imports = [
    ./hardware-configuration.nix
    ../../../../modules/displaylink
    ../../../../modules/git/work.nix
    ../../../../modules/microsoft
    ../../../../modules/mumble
    ../../../../modules/openvpn
  ];
}
