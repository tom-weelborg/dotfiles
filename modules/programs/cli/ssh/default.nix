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
      };
      mkConfig = { cfg }:
        {
          programs.ssh = {
            startAgent = cfg.startAgent;
          };
        };
    };
  }
  args
