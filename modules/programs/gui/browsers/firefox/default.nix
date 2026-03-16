{
  options = lib:
    {
      extraExtensions = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = [];
      };
    };

  module = { moduleConfig, pkgs, variables, ... }:
    {
      home-manager.users.${variables.username} = { ... }:
      {
        programs.firefox = import ../_shared/firefox.nix {
          inherit
            moduleConfig
            pkgs
            ;
        };
      };
    };
}
