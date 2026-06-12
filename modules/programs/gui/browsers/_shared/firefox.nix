{ configPath ? null, program, ... }:
let
  firefox = import ./base.nix {
    extraExtensionsTypeFunction = { lib }: lib.types.package;
    inherit program;
    programConfig = { lib, moduleConfig, pkgs, variables, xdg, ... }:
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
      } // lib.optionalAttrs (configPath != null) {
        configPath = configPath xdg;
      };
  };
in
  firefox
