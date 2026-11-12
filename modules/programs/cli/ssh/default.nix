{ lib, mkModule, ... }@args:
mkModule
  {
    modulePath = [
      "programs"
      "cli"
      "ssh"
    ];
    systemModule = {
      options = {
        startAgent = lib.mkEnableOption "ssh-agent";
        hosts = lib.mkOption {
          type = lib.types.listOf (lib.types.submodule {
            options = {
              name = lib.mkOption {
                type = lib.types.str;
              };
              hostname = lib.mkOption {
                type = lib.types.str;
              };
              port = lib.mkOption {
                type = lib.types.int;
                default = 22;
              };
              user = lib.mkOption {
                type = lib.types.str;
                default = "root";
              };
            };
          });
          default = [];
        };
      };
      mkConfig = { cfg }:
        let
          mapHosts = hosts:
            builtins.foldl'
              (acc: elem: acc + "\n\n" + elem)
              ""
              (builtins.map
                (host: ''
                  Host ${host.name}
                    Hostname ${host.hostname}
                    Port ${toString host.port}
                    User ${host.user}
                '')
                hosts
              );
        in
        {
          programs.ssh = {
            startAgent = cfg.startAgent;
            extraConfig = mapHosts cfg.hosts;
          };
        };
    };
  }
  args
