{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.media.xreader;
    in
    {
      options.modules.programs.gui.media.xreader = {
        enable = lib.mkEnableOption "xreader";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.xreader
        ];
      };
    };

  userModule = {
    programs.gui.media.xreader =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.xreader
        ];
      };
  };

  homeManagerModule = {
    programs.gui.media.xreader =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        home.packages = (lib.optionals pkgs.stdenv.isLinux [
          pkgs.xreader
        ]);
      };
  };
}
