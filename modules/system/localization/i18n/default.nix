{
  options = lib:
    {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };

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

  module = { lib, moduleConfig, ... }:
    {
      i18n.defaultLocale = moduleConfig.defaultLocale;

      i18n.extraLocaleSettings = lib.filterAttrs
        (_: v: v != null)
        moduleConfig.extraLocaleSettings
        ;
    };
}
