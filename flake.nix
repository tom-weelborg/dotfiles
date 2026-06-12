{
  description = "My NixOS configuration";

  inputs = {
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager?ref=release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-26.05";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    lib = nixpkgs.lib;
    
    utils = import ./lib lib;

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
          lib
          system
          variables
          ;
      } ./hosts [];
  };
}
