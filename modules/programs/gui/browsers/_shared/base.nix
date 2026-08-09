{
  browserName,
  defaultExtensionsFunction,
  extensionsTypeFunction,
  programConfig,
  programName,
  programPackageName
}:
{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.browsers.${browserName};
    in
    {
      options.modules.programs.gui.browsers.${browserName} = {
        enable = lib.mkEnableOption browserName;
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.${programPackageName}
        ];
      };
    };

  userModule = {
    programs.gui.browsers.${browserName} =
      {
        defaultExtensions ? null,
        extraExtensions ? []
      }:
      { username }:
      { lib, pkgs, ... }:
      let
        de =
          if defaultExtensions == null then
            defaultExtensionsFunction { inherit pkgs; }
          else
            defaultExtensions
          ;
      in
      {
        home-manager.users.${username} = { config, ... }:
        {
          programs.${programName} = programConfig {
            inherit lib;
            moduleConfig = {
              extensions = de ++ extraExtensions;
            };
            xdg = config.xdg;
          };
        };
      };
  };
}
