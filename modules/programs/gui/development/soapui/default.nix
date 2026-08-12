{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.development.soapui;
    in
    {
      options.modules.programs.gui.development.soapui = {
        enable = lib.mkEnableOption "soapui";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.soapui
        ];
      };
    };

  userModule = {
    programs.gui.development.soapui =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.soapui
        ];
      };
  };

  homeManagerModule = {
    programs.gui.development.soapui =
      { }:
      { username }:
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.soapui
        ];

        xdg.desktopEntries.soapui = {
          name = "SoapUI";
          genericName = "API Testing Tool";
          exec = "soapui";
          icon = "soapui";
          terminal = false;
          categories = [
            "Development"
            "Network"
          ];
        };
      };
  };
}
