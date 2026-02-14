{ pkgs, ... }:
let
  args = {
    inherit pkgs;
    overrideFunction = pkgs.lib.mkForce;
  };
in
{
  specialisation = {
    home.configuration = import ./home.nix args;

    work.configuration = import ./work.nix args;
  };
}