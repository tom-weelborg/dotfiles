{
  systemModule = { config, lib, ... }:
    let
      cfg = config.modules.system.xdg.mime;
    in
    {
      options.modules.system.xdg.mime = {
        enable = lib.mkEnableOption "mime";

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

      config = {
        xdg.mime = {
          enable = cfg.enable;

          defaultApplications = {
            "text/html" = cfg.browsers ++ cfg."text/html";
            "x-scheme-handler/about" = cfg.browsers ++ cfg."x-scheme-handler/about";
            "x-scheme-handler/http" = cfg.browsers ++ cfg."x-scheme-handler/http";
            "x-scheme-handler/https" = cfg.browsers ++ cfg."x-scheme-handler/https";
            "x-scheme-handler/unknown" = cfg.browsers ++ cfg."x-scheme-handler/unknown";
          };
        };
      };
    };

  homeManagerModule = {
    system.xdg.mime =
      {
        browsers ? [],
        text-html ? [],
        x-scheme-handler-about ? [],
        x-scheme-handler-http ? [],
        x-scheme-handler-https ? [],
        x-scheme-handler-unknown ? []
      }:
      { username }:
      { ... }:
      {
        xdg.mimeApps = {
          enable = true;
          defaultApplications = {
            "text/html" = browsers ++ text-html;
            "x-scheme-handler/about" = browsers ++ x-scheme-handler-about;
            "x-scheme-handler/http" = browsers ++ x-scheme-handler-http;
            "x-scheme-handler/https" = browsers ++ x-scheme-handler-https;
            "x-scheme-handler/unknown" = browsers ++ x-scheme-handler-unknown;
          };
        };
      };
  };
}
