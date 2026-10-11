{ mkModule, ... }@args:
mkModule
  {
    modulePath = [
      "system"
      "bootloader"
    ];
    systemModule = {
      options = {
      };
      mkConfig = { cfg }:
        {
          boot.loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
          };
        };
    };
  }
  args
