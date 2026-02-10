{ pkgs, variables, ... }:
let
  extensions = pkgs.nur.repos.rycee.firefox-addons;
in
{
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
            ];
          };
          settings = {
            "browser.translations.neverTranslateLanguages" = "de,en";
          };
        };
      };
    };
  };
}
