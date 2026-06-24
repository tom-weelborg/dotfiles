{
  systemModule = { config, lib, readDirIfExists, variables, ... }:
    let
      cfg = config.modules.programs.cli.vpn.openvpn;

      vpnFiles = readDirIfExists variables.vpnDir;
      vpnConfFiles = lib.attrNames (
        lib.filterAttrs (n: _: 
          lib.hasSuffix ".conf" n || lib.hasSuffix ".ovpn" n
        ) vpnFiles
      );
    in
    {
      options.modules.programs.cli.vpn.openvpn = {
        enable = lib.mkEnableOption "openvpn";
      };

      config = lib.mkIf cfg.enable {
        services.openvpn.servers =
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
                    config = ''config ${variables.vpnDir}/${filename}'';
                    autoStart = false;
                  };
                }
              )
              vpnConfFiles
          );
      };
    };
}
