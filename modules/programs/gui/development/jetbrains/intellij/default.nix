{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.development.jetbrains.intellij;
    in
    {
      options.modules.programs.gui.development.jetbrains.intellij = {
        enable = lib.mkEnableOption "intellij";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.jetbrains.idea
        ];
      };
    };

  userModule = { vmoptions ? "-Xmx4096m" }:
    { username }:
    { pkgs, ... }:
    {
      users.users.${username}.packages = pkgs.lib.mkAfter [
        pkgs.jetbrains.idea
      ];

      home-manager.users.${username} = { lib, ... }:
        {
          home.activation.intellijVmOptions =
            lib.hm.dag.entryAfter [ "writeBoundary" ] ''
              jetbrains_dir="$HOME/.config/JetBrains"

              if [ -d "$jetbrains_dir" ]; then
                for dir in "$jetbrains_dir"/IntelliJIdea*; do
                  if [ -d "$dir" ]; then
                    echo "${vmoptions}" > "$dir/idea64.vmoptions"
                  fi
                done
              fi
            '';
        };
    };
}
