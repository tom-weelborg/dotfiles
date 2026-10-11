{ lib, mkModule, pkgs, ... }@args:
let
  enableOptionDescription = "soapui";
in
mkModule
  {
    modulePath = [
      "programs"
      "gui"
      "development"
      "soapui"
    ];
    systemModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
      };
      mkConfig = { cfg }:
        lib.mkIf cfg.enable
        {
          environment.systemPackages = [
            pkgs.soapui
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
            pkgs.soapui
          ];
        };
    };
    homeManagerModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
      };
      mkConfig = { cfg, username }: { pkgs, ... }@homeManagerArgs:
        lib.mkIf cfg.enable
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
  args
