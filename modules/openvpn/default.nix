{ lib, variables, ... }:
let
  utils = import ../../lib;

  vpnFiles = utils.readDirIfExists variables.vpnDir;
  vpnConfFiles = lib.attrNames (
    lib.filterAttrs (n: _: 
      lib.hasSuffix ".conf" n || lib.hasSuffix ".ovpn" n
    ) vpnFiles
  );
in
{
  services.openvpn.servers =
    lib.listToAttrs (
      map (filename: 
        let
          name = lib.removeSuffix ".conf" (lib.removeSuffix ".ovpn" filename);
        in
        {
          inherit name;
          value = {
            config = ''config ${variables.vpnDir}/${filename}'';
            autoStart = false;
          };
        }
      ) vpnConfFiles
    );
}
