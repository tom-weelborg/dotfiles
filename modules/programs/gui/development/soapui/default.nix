{ pkgs, variables, ... }:
{
  environment.systemPackages = [
    pkgs.soapui
  ];

  home-manager.users.${variables.username} = {
    xdg.desktopEntries.soapui = {
        name = "SoapUI";
        genericName = "API Testing Tool";
        exec = "soapui";
        icon = "soapui";
        terminal = false;
        categories = ["Development" "Network"];
    };
  };
}
