{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.media.makemkv;
    in
    {
      options.modules.programs.gui.media.makemkv = {
        enable = lib.mkEnableOption "makemkv";
      };

      config = lib.mkIf cfg.enable {
        boot.kernelModules = lib.mkAfter [
          "sg"
        ];

        environment.systemPackages = [
          pkgs.makemkv
        ];
      };
    };

  userModule = {
    programs.gui.media.makemkv =
      {
        package ? null,
        tokenPath ? null,
        settingsDefault ? {
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
        },
        settingsOverride ? {}
      }:
      { username }:
      { lib, pkgs, ... }:
      let
        settings = settingsDefault // settingsOverride;

        settingsFileContent = lib.generators.toINIWithGlobalSection {} {
          globalSection = builtins.mapAttrs (_: value: ''"${value}"'') settings;
        };
      in
      {
        boot.kernelModules = lib.mkAfter [
          "sg"
        ];

        users.users.${username} = {
          packages = lib.mkAfter [
            (if (package != null) then package else pkgs.makemkv)
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

            key=${lib.optionalString (tokenPath != null) "$(cat ${tokenPath})"}

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
    programs.gui.media.makemkv =
      { }:
      { username }:
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.makemkv
        ];
      };
  };
}
