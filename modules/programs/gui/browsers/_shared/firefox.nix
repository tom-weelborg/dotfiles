{ configPath ? null, program, ... }:
let
  firefox = import ./base.nix {
    defaultExtensionsFunction = { pkgs, ... }:
      with pkgs.nur.repos.rycee.firefox-addons; [
        keepassxc-browser
        ublock-origin
        youtube-recommended-videos
      ];
    extensionsTypeFunction = { lib }: lib.types.package;
    inherit program;
    programConfig = { lib, moduleConfig, pkgs, variables, xdg, ... }:
      {
        enable = true;
        profiles = {
          default = {
            extensions = {
              packages = moduleConfig.defaultExtensions ++ moduleConfig.extraExtensions;
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
