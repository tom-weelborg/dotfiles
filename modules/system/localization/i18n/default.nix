{ lib, mkModule, ... }@args:
mkModule
  {
    modulePath = [
      "system"
      "localization"
      "i18n"
    ];
    systemModule = {
      options = {
        defaultLocale = lib.mkOption {
          type = lib.types.str;
          default = "en_US.UTF-8";
        };

        extraLocaleSettings = {
          LC_ALL = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = null;
          };

          LC_ADDRESS = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = "de_DE.UTF-8";
          };

          LC_COLLATE = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = null;
          };

          LC_CTYPE = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = null;
          };

          LC_IDENTIFICATION = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = "de_DE.UTF-8";
          };

          LC_MEASUREMENT = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = "de_DE.UTF-8";
          };

          LC_MESSAGES = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = null;
          };

          LC_MONETARY = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = "de_DE.UTF-8";
          };

          LC_NAME = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = "de_DE.UTF-8";
          };

          LC_NUMERIC = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = "de_DE.UTF-8";
          };

          LC_PAPER = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = "de_DE.UTF-8";
          };

          LC_TELEPHONE = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = "de_DE.UTF-8";
          };

          LC_TIME = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = "de_DE.UTF-8";
          };
        };
      };
      mkConfig = { cfg }:
        {
          i18n.defaultLocale = cfg.defaultLocale;

          i18n.extraLocaleSettings = lib.filterAttrs
            (_: v: v != null)
            cfg.extraLocaleSettings
            ;
        };
    };
    homeManagerModule = {
      options = {
        enable = lib.mkEnableOption "i18n";
        language = {
          address = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = null;
          };

          base = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = null;
          };

          collate = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = null;
          };

          ctype = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = null;
          };

          measurement = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = null;
          };

          messages = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = null;
          };

          monetary = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = null;
          };

          name = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = null;
          };

          numeric = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = null;
          };

          paper = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = null;
          };

          telephone = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = null;
          };

          time = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = null;
          };
        };
      };
      mkConfig = { cfg, username }: { ... }@homeManagerArgs:
        lib.mkIf cfg.enable
        {
          home.language = cfg.language;
        };
    };
  }
  args
