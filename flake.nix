{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager?ref=release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    utils = import ./lib;

    vars = import ./variables.nix;
    variables = vars // utils.importIfExists {
      path = vars.privateVariablesPath;
    };

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
          inputs.home-manager.nixosModules.default
          inputs.nur.modules.nixos.default
        ];
      };
      work = nixpkgs.lib.nixosSystem{
        specialArgs = {
          inherit
            variables
            ;
        };
        modules = [
          ./configuration.nix
          ./modules/shared.nix
          ./hosts/work/laptops/2026-01
          inputs.home-manager.nixosModules.default
          inputs.nur.modules.nixos.default
        ];
      };
    };
  };
}
