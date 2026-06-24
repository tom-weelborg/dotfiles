{ config, lib, pkgs, ... }:
let
  args = {
    inherit pkgs;
    overrideFunction = pkgs.lib.mkForce;
  };
in
{
  options.specialisations = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf config.specialisations.enable {
    specialisation = {
      home.configuration = import ./home.nix args;

      work.configuration = import ./work.nix args;
    };
  };
}
