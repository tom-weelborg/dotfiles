{ browserName, configPath ? null, programName, programPackageName, ... }:
let
  firefox = import ./base.nix {
    inherit
      browserName
      programName
      programPackageName
      ;
    defaultExtensionsFunction = { pkgs, ... }:
      with pkgs.firefox-addons; [
        keepassxc-browser
        ublock-origin
        youtube-recommended-videos
      ];
    extensionsTypeFunction = { lib }: lib.types.package;
    programConfig = { lib, moduleConfig, xdg, ... }:
      {
        enable = true;
        profiles = {
          default = {
            extensions = {
              packages = moduleConfig.extensions;
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
