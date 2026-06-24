{
  systemModule = { config, lib, ... }:
    let
      cfg = config.modules.system.localization.i18n;
    in
    {
      options.modules.system.localization.i18n = {
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

      config = {
        i18n.defaultLocale = cfg.defaultLocale;

        i18n.extraLocaleSettings = lib.filterAttrs
          (_: v: v != null)
          cfg.extraLocaleSettings
          ;
      };
    };

  userModule = {
      address ? null,
      base ? null,
      collate ? null,
      ctype ? null,
      measurement ? null,
      messages ? null,
      monetary ? null,
      name ? null,
      numeric ? null,
      paper ? null,
      telephone ? null,
      time ? null
    }@inputs:
    { username }:
    { ... }:
    {
      home-manager.users.${username} = {
        home.language = inputs;
      };
    };
}
