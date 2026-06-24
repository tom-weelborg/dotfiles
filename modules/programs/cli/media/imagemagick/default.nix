{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.cli.media.imagemagick;
    in
    {
      options.modules.programs.cli.media.imagemagick = {
        enable = lib.mkEnableOption "imagemagick";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.imagemagick
        ];
      };
    };

  userModule = { }:
    { username }:
    { lib, pkgs, ... }:
    {
      users.users.${username}.packages = lib.mkAfter [
        pkgs.imagemagick
      ];
    };
}
