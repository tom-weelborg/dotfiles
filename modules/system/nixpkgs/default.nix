{
  systemModule = { config, lib, ... }:
    let
      cfg = config.modules.system.nixpkgs;
    in
    {
      options.modules.system.nixpkgs = {
        allowUnfree = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
      };

      config = {
        nixpkgs.config.allowUnfree = cfg.allowUnfree;
      };
    };
}
