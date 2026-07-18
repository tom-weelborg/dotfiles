{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.cli.ssh;
    in
    {
      options.modules.programs.cli.ssh = {
        startAgent = lib.mkEnableOption "ssh-agent";
      };

      config = {
        programs.ssh.startAgent = cfg.startAgent;
      };
    };
}
