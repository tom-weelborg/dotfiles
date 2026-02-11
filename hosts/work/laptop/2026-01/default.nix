{ pkgs, ... }:
{
  modules = {
    apps = {
      gui = {
        browsers = {
          firefox = {
            enable = true;
            extraExtensions = [
              pkgs.nur.repos.rycee.firefox-addons.requestly
            ];
          };
        };
      };
    };
  };

  imports = [
    ./hardware-configuration.nix
    ../../../../modules/git/work.nix
  ];
}
