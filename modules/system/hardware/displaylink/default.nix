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

        nixpkgs.overlays = [
          (final: prev: {
            linuxPackages_latest =
              prev.linuxPackages_latest.extend
                (lpfinal: lpprev: {
                  evdi = lpprev.evdi.overrideAttrs (efinal: eprev: rec {
                    version = "1.15.0";
                    src = final.fetchFromGitHub {
                      owner = "DisplayLink";
                      repo = "evdi";
                      rev = "v${version}";
                      sha256 = "sha256-CXF7PvmrPjjNoWXbWxEkFE/Sw4bO6YqDplPwF/OxhB0=";
                    };
                    prePatch = "";
                    postPatch = "";
                    patches = [
                      ./fix-conftest-probes.patch
                    ];
                    env = (eprev.env or { }) // {
                      CFLAGS = toString [
                        "-Wno-error"
                        "-Wno-error=sign-compare"
                      ];
                    };
                  });
                });
            displaylink = prev.displaylink.override {
              inherit (final.linuxPackages_latest) evdi;
            };
          })
        ];
      };
    };
}
