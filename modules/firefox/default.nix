{ config, lib, pkgs, variables, ... }:
let
  extensions = pkgs.nur.repos.rycee.firefox-addons;
in
{
  options = {
    modules.firefox = {
      enable = lib.mkEnableOption "firefox";
      extraExtensions = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = [];
      };
    };
  };

  config = lib.mkIf config.modules.firefox.enable {
    home-manager.users.${variables.username} = { ... }:
    {
      programs.firefox = {
        enable = true;
        package = pkgs.firefox;
        profiles = {
          default = {
            extensions = {
              packages = with extensions; [
                keepassxc-browser
                ublock-origin
              ] ++ config.modules.firefox.extraExtensions;
            };
            settings = {
              "browser.translations.neverTranslateLanguages" = "de,en";
            };
          };
        };
      };
    };
  };
}
