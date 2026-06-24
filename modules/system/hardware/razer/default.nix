{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.system.hardware.razer;
    in
    {
      options.modules.system.hardware.razer = {
        enable = lib.mkEnableOption "razer";
      };

      config = lib.mkIf cfg.enable {
        hardware.openrazer = {
          enable = true;
        };

        environment.systemPackages = with pkgs; [
          polychromatic
        ];
      };
    };

  userModule = { }:
    { username }:
    { lib, ... }:
    {
      hardware.openrazer = {
        users = lib.mkAfter [ username ];
      };
    };
}
