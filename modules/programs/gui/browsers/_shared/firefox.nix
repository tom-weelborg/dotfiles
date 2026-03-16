{ moduleConfig, pkgs, ... }:
let
  extensions = pkgs.nur.repos.rycee.firefox-addons;
in
{
  enable = true;
  profiles = {
    default = {
      extensions = {
        packages = with extensions; [
          keepassxc-browser
          ublock-origin
          youtube-recommended-videos
        ] ++ moduleConfig.extraExtensions;
      };
      settings = {
        "browser.translations.neverTranslateLanguages" = "de,en";
      };
    };
  };
}