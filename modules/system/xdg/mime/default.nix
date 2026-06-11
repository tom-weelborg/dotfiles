{
  options = lib:
    {
      browsers = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
      };

      "text/html" = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
      };
      "x-scheme-handler/about" = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
      };
      "x-scheme-handler/http" = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
      };
      "x-scheme-handler/https" = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
      };
      "x-scheme-handler/unknown" = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
      };
    };

  module = { moduleConfig, ... }:
    {
      xdg.mime = {
        enable = moduleConfig.enable;

        defaultApplications = {
          "text/html" = moduleConfig.browsers ++ moduleConfig."text/html";
          "x-scheme-handler/about" = moduleConfig.browsers ++ moduleConfig."x-scheme-handler/about";
          "x-scheme-handler/http" = moduleConfig.browsers ++ moduleConfig."x-scheme-handler/http";
          "x-scheme-handler/https" = moduleConfig.browsers ++ moduleConfig."x-scheme-handler/https";
          "x-scheme-handler/unknown" = moduleConfig.browsers ++ moduleConfig."x-scheme-handler/unknown";
        };
      };
    };
}
