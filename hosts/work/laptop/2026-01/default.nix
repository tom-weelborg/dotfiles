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
  ];
}
