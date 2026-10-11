{ lib, mkModule, ... }@args:
let
  enableOptionDescription = "xdg-mime";
in
mkModule
  {
    modulePath = [
      "system"
      "xdg"
      "mime"
    ];
    systemModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;

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
      mkConfig = { cfg }:
        lib.mkIf cfg.enable
        {
          xdg.mime = {
            enable = true;

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
      options = {
        enable = lib.mkEnableOption enableOptionDescription;

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
      mkConfig = { cfg, username }: { ... }@homeManagerArgs:
        lib.mkIf cfg.enable
        {
          xdg.mimeApps = {
            enable = true;

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
  }
  args
