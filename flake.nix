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
  in
  {
    nixosConfigurations =
      utils.discoverHosts {
        inherit
          inputs
          system
          variables
          ;
        lib = nixpkgs.lib;
      } ./hosts [];
  };
}
