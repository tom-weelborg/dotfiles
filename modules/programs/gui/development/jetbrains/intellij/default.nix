{
  options = { lib, ... }:
    {
      vmoptions = lib.mkOption {
        type = lib.types.str;
        default = "-Xmx4096m";
      };
    };

  module = { moduleConfig, pkgs, variables, ... }:
    {
      environment.systemPackages = with pkgs.jetbrains; [
        idea
      ];

      home-manager.users.${variables.username} = { lib, ... }:
        {
          home.activation.intellijVmOptions =
            lib.hm.dag.entryAfter [ "writeBoundary" ] ''
              jetbrains_dir="$HOME/.config/JetBrains"

              if [ -d "$jetbrains_dir" ]; then
                for dir in "$jetbrains_dir"/IntelliJIdea*; do
                  if [ -d "$dir" ]; then
                    echo "${moduleConfig.vmoptions}" > "$dir/idea64.vmoptions"
                  fi
                done
              fi
            '';
        };
    };
}
