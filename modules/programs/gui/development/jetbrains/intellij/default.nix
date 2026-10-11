{ lib, mkModule, pkgs, ... }@args:
let
  enableOptionDescription = "intellij";
in
mkModule
  {
    modulePath = [
      "programs"
      "gui"
      "development"
      "jetbrains"
      "intellij"
    ];
    systemModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
      };
      mkConfig = { cfg }:
        lib.mkIf cfg.enable
        {
          environment.systemPackages = [
            pkgs.jetbrains.idea
          ];
        };
    };
    userModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
      };
      mkConfig = { cfg, username }:
        lib.mkIf cfg.enable
        {
          users.users.${username}.packages = lib.mkAfter [
            pkgs.jetbrains.idea
          ];
        };
    };
    homeManagerModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
        vmoptions = lib.mkOption {
          type = lib.types.str;
          default = ''
            -Dawt.toolkit.name=XToolkit
            -Xmx4096m
          '';
        };
      };
      mkConfig = { cfg, username }: { lib, pkgs, ... }@homeManagerArgs:
        lib.mkIf cfg.enable
        {
          home.packages = [
            pkgs.jetbrains.idea
          ];

          home.activation.intellijVmOptions =
            lib.hm.dag.entryAfter [ "writeBoundary" ] ''
              jetbrains_dir="$HOME/.config/JetBrains"

              if [ -d "$jetbrains_dir" ]; then
                for dir in "$jetbrains_dir"/IntelliJIdea*; do
                  if [ -d "$dir" ]; then
                    echo "${cfg.vmoptions}" > "$dir/idea64.vmoptions"
                  fi
                done
              fi
            '';
        };
    };
  }
  args
