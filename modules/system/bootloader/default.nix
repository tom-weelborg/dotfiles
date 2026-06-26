{
  systemModule = { config, lib, ... }:
    let
      cfg = config.modules.system.bootloader;
    in
    {
      options.modules.system.bootloader = {
      };

      config = {
        boot.loader = {
          systemd-boot.enable = true;
          efi.canTouchEfiVariables = true;
        };
      };
    };
}
