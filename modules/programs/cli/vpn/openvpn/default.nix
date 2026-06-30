{
  systemModule = { config, lib, pkgs, readDirIfExists, ... }:
    let
      cfg = config.modules.programs.cli.vpn.openvpn;
    in
    {
      options.modules.programs.cli.vpn.openvpn = {
        enable = lib.mkEnableOption "openvpn";
        vpnDir = lib.mkOption {
          type = lib.types.str;
        };
      };

      config = lib.mkIf cfg.enable {
        networking.networkmanager.plugins = lib.mkAfter [
          pkgs.networkmanager-openvpn
        ];

        services.openvpn.servers =
          let
            vpnFiles = readDirIfExists cfg.vpnDir;
            vpnConfFiles = lib.attrNames (
              lib.filterAttrs (n: _: 
                lib.hasSuffix ".conf" n || lib.hasSuffix ".ovpn" n
              ) vpnFiles
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
