{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
  };

  outputs = { self, nixpkgs }:
  let
    variables = import ./variables.nix;

    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem{
        specialArgs = {
          inherit
            variables
            ;
        };
        modules = [
          ./configuration.nix
          ./modules/shared.nix
        ];
      };
    };
  };
}
