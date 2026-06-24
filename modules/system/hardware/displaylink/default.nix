{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.system.hardware.displaylink;
    in
    {
      options.modules.system.hardware.displaylink = {
        enable = lib.mkEnableOption "displaylink";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
          displaylink
        ];

        services.xserver.videoDrivers = [
          "displaylink"
        ];

        systemd.services.dlm.wantedBy = [
          "multi-user.target"
        ];
      };
    };
}
