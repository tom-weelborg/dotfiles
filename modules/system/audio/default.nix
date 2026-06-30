{
  systemModule = { config, lib, ... }:
    let
      cfg = config.modules.system.audio;
    in
    {
      options.modules.system.audio = {
        pipewire = {
          enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
          };

          alsa = {
            enable = lib.mkOption {
              type = lib.types.bool;
              default = true;
            };
            support32Bit = lib.mkOption {
              type = lib.types.bool;
              default = true;
            };
          };

          pulse = {
            enable = lib.mkOption {
              type = lib.types.bool;
              default = true;
            };
          };
        };

        pulseaudio = {
          enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };
        };

        rtkit = {
          enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
          };
        };
      };

      config = {
        services.pipewire = {
          enable = cfg.pipewire.enable;
          alsa = {
            enable = cfg.pipewire.alsa.enable;
            support32Bit = cfg.pipewire.alsa.support32Bit;
          };
          pulse.enable = cfg.pipewire.pulse.enable;
        };

        services.pulseaudio.enable = cfg.pulseaudio.enable;

        security.rtkit.enable = cfg.rtkit.enable;
      };
    };
}
