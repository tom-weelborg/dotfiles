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
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        boot.kernelModules = lib.mkAfter [
          "sg"
        ];

        users.users.${username} = {
          packages = lib.mkAfter [
            pkgs.makemkv
          ];

          extraGroups = lib.mkAfter [
            "cdrom"
            "plugdev"
            "video"
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
