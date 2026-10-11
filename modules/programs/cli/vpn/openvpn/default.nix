{ lib, mkModule, pkgs, readDirIfExists, ... }@args:
mkModule
  {
    modulePath = [
      "programs"
      "cli"
      "vpn"
      "openvpn"
    ];
    systemModule = {
      options = {
        enable = lib.mkEnableOption "openvpn";
        vpnDir = lib.mkOption {
          type = lib.types.str;
        };
      };
      mkConfig = { cfg }:
        lib.mkIf cfg.enable
        {
          networking.networkmanager.plugins = lib.mkAfter [
            pkgs.networkmanager-openvpn
          ];

          services.openvpn.servers =
            let
              vpnFiles = readDirIfExists cfg.vpnDir;
              vpnConfFiles = lib.attrNames (
                lib.filterAttrs
                  (n: _: lib.hasSuffix ".conf" n || lib.hasSuffix ".ovpn" n)
                  vpnFiles
              );
            in
            lib.listToAttrs (
              map
                (filename:
                  let
                    name = lib.removeSuffix
                      ".conf"
                      (lib.removeSuffix
                        ".ovpn"
                        filename
                      );
                  in
                  {
                    inherit name;
                    value = {
                      config = ''config ${cfg.vpnDir}/${filename}'';
                      autoStart = false;
                    };
                  }
                )
                vpnConfFiles
            );
        };
    };
  }
  args
