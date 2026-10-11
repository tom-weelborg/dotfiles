{ lib, mkModule, pkgs, ... }@args:
let
  enableOptionDescription = "makemkv";
in
mkModule
  {
    modulePath = [
      "programs"
      "gui"
      "media"
      "makemkv"
    ];
    systemModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
      };
      mkConfig = { cfg }:
        lib.mkIf cfg.enable
        {
          boot.kernelModules = lib.mkAfter [
            "sg"
          ];

          environment.systemPackages = [
            pkgs.makemkv
          ];
        };
    };
    userModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
        package = lib.mkOption {
          type = lib.types.package;
          default = pkgs.makemkv;
        };
        tokenPath = lib.mkOption {
          type = lib.types.nullOr lib.types.str;
          default = null;
        };
        settingsDefault = lib.mkOption {
          type = lib.types.attrs;
          default = {
            "app_DefaultSelectionString" = builtins.concatStringsSep "," [
              "+sel:all"
              "-sel:angle"
            ];
            "app_DestinationDir" = "";
            "app_ExpertMode" = "1";
            "app_Java" = "";
            "app_Key" = "$key";
            "app_Proxy" = "";
            "app_ccextractor" = "";
            "sdf_Stop" = "";
          };
        };
        settingsOverride = lib.mkOption {
          type = lib.types.attrs;
          default = {};
        };
      };
      mkConfig = { cfg, username }:
        let
          settings = cfg.settingsDefault // cfg.settingsOverride;

          settingsFileContent = lib.generators.toINIWithGlobalSection {} {
            globalSection = builtins.mapAttrs (_: value: ''"${value}"'') settings;
          };
        in
        lib.mkIf cfg.enable
        {
          boot.kernelModules = lib.mkAfter [
            "sg"
          ];

          users.users.${username} = {
            packages = lib.mkAfter [
              cfg.package
            ];

            extraGroups = lib.mkAfter [
              "cdrom"
              "plugdev"
              "video"
            ];
          };

          systemd.services.makemkv-config = {
            description = "Generate MakeMKV configuration";

            wantedBy = [
              "multi-user.target"
            ];

            before = [
              "makemkv.service"
            ];

            serviceConfig = {
              Type = "oneshot";
              User = username;
              UMask = "0077";
            };

            script = ''
              set -euo pipefail

              config_dir=/home/${username}/.MakeMKV/
              config_file="$config_dir/settings.conf"

              mkdir -p "$config_dir"

              key=${lib.optionalString (cfg.tokenPath != null) "$(cat ${cfg.tokenPath})"}

              cat > "$config_file" <<EOF
              ${settingsFileContent}
              EOF

              chmod 600 "$config_file"
            '';
          };

          systemd.services.makemkv = {
            requires = [
              "makemkv-config.service"
            ];
            after = [
              "makemkv-config.service"
            ];
          };
        };
    };
    homeManagerModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
      };
      mkConfig = { cfg, username }: { pkgs, ... }@homeManagerArgs:
        lib.mkIf cfg.enable
        {
          home.packages = [
            pkgs.makemkv
          ];
        };
    };
  }
  args
