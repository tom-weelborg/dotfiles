{ pkgs, ... }:
{
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
            evdi = lpprev.evdi.overrideAttrs (efinal: eprev: {
                version = "1.14.13";
                src = final.fetchFromGitHub {
                  owner = "DisplayLink";
                  repo = "evdi";
                  rev = "v1.14.13";
                  sha256 = "sha256-59Tr2l2RHOW/TMgSW0HY0l60L7mBZKmYyx/r+Y0NatQ=";
                };
            });
          });
      displaylink = prev.displaylink.override {
        inherit (final.linuxPackages_latest) evdi;
      };
    })
  ];
}
